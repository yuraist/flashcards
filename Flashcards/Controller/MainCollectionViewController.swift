//
//  MainCollectionViewController.swift
//  Flashcards
//
//  Created by Юрий Истомин on 02/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import UIKit
import CoreData

class MainCollectionViewController: UICollectionViewController {
  
  var container: NSPersistentContainer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    container = NSPersistentContainer(name: "Flashcards")
    
    container.loadPersistentStores { (storeDescription, error) in
      if let error = error {
        print("Unresolved error: \(error)")
      }
    }
    
//    let card = Card(context: container.viewContext)
//    card.backText = "What is love?"
//    card.frontText = "Baby, don't hurt me!"
//
//    saveContext()
    loadSavedData()
  }
  
  var cards = [Card]()
  
  func loadSavedData() {
    let request = Deck.createFetchRequest()
    
    do {
      let decks = try container.viewContext.fetch(request)
      print("Got \(decks.count) decks")
      
      if let deck = decks.first {
        print("The first has \(deck.cards.count) cards")
      }
    } catch {
      print("Fetch failed")
    }
  }
  
  func printAllCards() {
    for card in cards {
      print("Card: \(card.backText) - \(card.frontText)")
    }
    
//    let deck = Deck(context: container.viewContext)
//    deck.name = "Songs"
//    deck.cards = NSSet(array: cards)
//
//    saveContext()
  }
  
  func saveContext() {
    if container.viewContext.hasChanges {
      do {
        try container.viewContext.save()
      } catch {
        print("An error occured while saving: \(error)")
      }
    }
  }
  
}

