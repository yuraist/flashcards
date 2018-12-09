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
    let request = Card.createFetchRequest()
    
    do {
      cards = try container.viewContext.fetch(request)
      print("Got \(cards.count) cards")
      printAllCards()
    } catch {
      print("Fetch failed")
    }
  }
  
  func printAllCards() {
    for card in cards {
      print("Card: \(card.backText) - \(card.frontText)")
    }
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

