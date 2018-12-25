//
//  Deck+CoreDataProperties.swift
//  Flashcards
//
//  Created by Юрий Истомин on 09/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//
//

import Foundation
import CoreData


extension Deck {
    
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }
    
    @NSManaged public var name: String
    @NSManaged public var cards: NSSet
    
}

// MARK: Generated accessors for cards
extension Deck {
    
    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Card)
    
    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Card)
    
    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)
    
    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)
    
}
