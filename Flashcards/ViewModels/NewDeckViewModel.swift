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
  
  let frontCardSideText = Observable("")
  let backCardSideText = Observable("")
}

extension NewDeckViewModel {
  
  var hasValidDeckName: Bool {
    return deckName.value.count > 0
  }
  
  var cardsCount: Int {
    return deck.cards.count
  }
  
  func update(deckName name: String) {
    deckName.value = name
  }
  
  func createDeck() {
    if hasValidDeckName {
      deck.name = deckName.value
      
//      AppDelegate.saveContext()
    }
  }
  
  func updateFrontCardSideText(withString string: String) {
    frontCardSideText.value = string
  }
  
  func updateBackCardSideText(withString string: String) {
    backCardSideText.value = string
  }
  
  func saveCard() {
    if frontCardSideText.value.count > 0 && backCardSideText.value.count > 0 {
      let card = Card(context: AppDelegate.viewContext)
      card.frontText = frontCardSideText.value
      card.backText = backCardSideText.value
      
      deck.addToCards(card)
      cleanTexts()
    }
  }
  
  func saveDeck() {
    AppDelegate.saveContext()
  }
}

extension NewDeckViewModel {
  private func cleanTexts() {
    frontCardSideText.value = ""
    backCardSideText.value = ""
  }
}
