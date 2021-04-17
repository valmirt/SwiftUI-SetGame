//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Valmir Junior on 17/04/21.
//

import Foundation

final class SetGameViewModel: ObservableObject {
    @Published private var model: SetGame = SetGame()
    private let firstRoundCards = 12
    
    //MARK: - Access to the Model
    var firstCards: [SetGame.Card] {
        Array(model.cards.prefix(firstRoundCards))
    }
}
