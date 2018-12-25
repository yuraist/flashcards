//
//  Card+CoreDataProperties.swift
//  Flashcards
//
//  Created by Юрий Истомин on 09/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//
//

import Foundation
import CoreData


extension Card {
    
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }
    
    @NSManaged public var backText: String
    @NSManaged public var frontText: String
    @NSManaged public var deck: Deck
    
    
    
}
