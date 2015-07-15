//
//  Ad.swift
//  Matchboard
//
//  Created by lsecrease on 7/14/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import Foundation


class Ad: PFObject, PFSubclassing {
    @NSManaged var image: PFFile
    @NSManaged var user: PFUser
    @NSManaged var lookingFor: String?
    @NSManaged var name: String?
    @NSManaged var category: NSMutableArray?

    //1
    class func parseClassName() -> String {
        return "WallPost"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
}

    override class func query() -> PFQuery? {
        let query = PFQuery(className: Ad.parseClassName()) //1
        query.includeKey("user") //2
        
        return query
    }
    
    init(image: PFFile, user: PFUser, lookingFor: String?, name: String?, category: NSMutableArray?) {
        super.init()
        
        self.image = image
        self.user = user
        self.lookingFor = lookingFor
        self.name = name
        self.category = category
    }
    
    override init() {
        super.init()
    }
    
}


