//
//  CategoryHeader.swift
//  Matchboard
//
//  Created by lsecrease on 7/5/15.
//  Copyright (c) 2015 ImagineME. All rights reserved.
//

import Foundation


class CategoryHeader
{
    // Variables
    var name: String            // name of the category Header
    var category: [Category]     // all products in the line

init(named: String, includeCategory: [Category])

{
    name = named
    category = includeCategory
}

    class func categoryHeaders() -> [CategoryHeader]
    {
        return [self.community(), self.housing(), self.personals(), self.buygoods(), self.buyservices()]
}
    
     // Private methods
    
     private class func community() -> CategoryHeader {
        var categories = [Category]()
        
        categories.append(Category(titled: "General Chat"))
        categories.append(Category(titled: "Events"))
        categories.append(Category(titled: "Groups and Organizations"))
        categories.append(Category(titled: "Rideshare"))
        categories.append(Category(titled: "Shoutout!"))
        categories.append(Category(titled: "Volunteerism"))
        categories.append(Category(titled: "Just Browsing"))
        
        return CategoryHeader(named: "Community", includeCategory: categories)
        
    }
    
    
    private class func housing() -> CategoryHeader {
        var categories = [Category]()
        
        categories.append(Category(titled: "Offering Apartment"))
        categories.append(Category(titled: "Seeking Apartment"))
        categories.append(Category(titled: "Offering a Room"))
        categories.append(Category(titled: "Seeking a Room"))
        categories.append(Category(titled: "Parking/Storage"))
        categories.append(Category(titled: "Real Estate"))
        categories.append(Category(titled: "Vacation Rentals"))
        
        return CategoryHeader(named: "Housing", includeCategory: categories)
        
    }
    
    private class func personals() -> CategoryHeader {
        var categories = [Category]()
        
        categories.append(Category(titled: "Men Seeking Women"))
        categories.append(Category(titled: "Men Seeking Men"))
        categories.append(Category(titled: "Women Seeking Men"))
        categories.append(Category(titled: "Women Seeking Women"))
    
        
        return CategoryHeader(named: "Personals", includeCategory: categories)
        
    }
    
    private class func buygoods() -> CategoryHeader {
        var categories = [Category]()
        
        categories.append(Category(titled: "Arts, Crafts & Hobbies"))
        categories.append(Category(titled: "Babies & Kids"))
        categories.append(Category(titled: "Free"))
        categories.append(Category(titled: "Garden, Shop & Tools"))
        categories.append(Category(titled: "Household"))
        categories.append(Category(titled: "Motor Vehicle & Heavy Equipment"))
        categories.append(Category(titled: "Personal Fashion & Health"))
        categories.append(Category(titled: "Sports, Recreation & Leisure"))
        categories.append(Category(titled: "Electronics & Technology"))
        categories.append(Category(titled: "Wanted"))
        
        return CategoryHeader(named: "Buy & Sell Goods", includeCategory: categories)
        
    }
    
    private class func buyservices() -> CategoryHeader {
        var categories = [Category]()
        
        categories.append(Category(titled: "Automotive"))
        categories.append(Category(titled: "Childcare"))
        categories.append(Category(titled: "Creative"))
        categories.append(Category(titled: "Education"))
        categories.append(Category(titled: "Health & Beauty"))
        categories.append(Category(titled: "Household"))
        categories.append(Category(titled: "Labor/Moving"))
        categories.append(Category(titled: "Professional"))
        categories.append(Category(titled: "Electronics & Technology"))
        
        return CategoryHeader(named: "Buy & Sell Services", includeCategory: categories)
        
    }
    
    
    
    
    
    
    
    

}