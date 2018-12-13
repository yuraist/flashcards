//
//  NewDeckViewModel.swift
//  Flashcards
//
//  Created by Юрий Истомин on 12/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import Foundation

class NewDeckViewModel {
  
  private let deck = Deck(context: AppDelegate.viewContext)
  let deckName = Observable("")
}

extension NewDeckViewModel {
  
  var hasValidDeckName: Bool {
    return deckName.value.count > 0
  }
  
  func update(deckName name: String) {
    deckName.value = name
  }
  
  func createDeck() {
    if hasValidDeckName {
      deck.name = deckName.value
      
      AppDelegate.saveContext()
    }
  }
}
