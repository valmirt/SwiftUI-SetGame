//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Valmir Junior on 17/04/21.
//

import Foundation

final class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame = SetGame()
    
    //MARK: - Access to the Model
    var firstCards: [SetGame.Card] {
        model.currentShowCards
    }
    var deckCount: Int {
        model.cards.count
    }
    var setsCount: Int {
        model.correctlySets
    }
    var canAddMoreCards: Bool {
        model.canAddMoreCards
    }
    
    //MARK: - Intent(s)
    func choose(card: SetGame.Card) {
        model.choose(card: card)
    }
    
    func addThreeMoreCards() {
        model.addThreeMoreCards()
    }
    
    func startNewGame() {
        model.startSetGame()
    }
}
