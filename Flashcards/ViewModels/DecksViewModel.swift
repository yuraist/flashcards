//
//  DecksViewModel.swift
//  Flashcards
//
//  Created by Юрий Истомин on 11/12/2018.
//  Copyright © 2018 Treedo. All rights reserved.
//

import Foundation
import CoreData

class DecksViewModel {
    
    var decks = [Deck]()
    
    init() {
        fetchDecks()
    }
}

extension DecksViewModel {
    func fetchDecks() {
        let request = Deck.createFetchRequest()
        
        do {
            decks = try AppDelegate.viewContext.fetch(request)
        } catch {
            print("An error \(error) occured when fetch decks")
        }
    }
}
