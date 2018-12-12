//
//  NewDeckViewModel.swift
//  Flashcards
//
//  Created by Юрий Истомин on 12/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import Foundation

class NewDeckViewModel {
  
  var deck = Deck(context: AppDelegate.viewContext)
  var deckName = Observable("")
}

extension NewDeckViewModel {
  func update(deckName name: String) {
    deckName.value = name
  }
}
