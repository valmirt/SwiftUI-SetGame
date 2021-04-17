//
//  SetGame.swift
//  SetGame
//
//  Created by Valmir Junior on 17/04/21.
//

import SwiftUI

enum SetShape {
    case diamond, rectangle, oval
}

enum ShadingShape {
    case solid, striped, open
}

struct SetGame {
    private let firstRoundCards = 12
    private(set) var cards: [Card]
    private(set) var currentShowCards: [Card] = []
    private(set) var correctlySets: Int = 0
    
    var canAddMoreCards: Bool {
        currentShowCards.count <= firstRoundCards
    }
    
    init() {
        cards = []
        createSetDeck()
        cards.shuffle()
        startSetGame()
    }
    
    private mutating func createSetDeck() {
        for shapeIndex in 1...3 {
            for shadingIndex in 1...3 {
                for colorIndex in 1...3 {
                    for index in 1...3 {
                        var shape = SetShape.diamond
                        switch shapeIndex {
                        case 2: shape = .rectangle
                        case 3: shape = .oval
                        default: break
                        }
                        var shading = ShadingShape.solid
                        switch shadingIndex {
                        case 2: shading = .striped
                        case 3: shading = .open
                        default: break
                        }
                        var color = Color.purple
                        switch colorIndex {
                        case 2: color = .green
                        case 3: color = .red
                        default: break
                        }
                        cards.append(Card(shape: shape, shading: shading, color: color, quantity: index))
                    }
                }
            }
        }
    }
    
    private mutating func startSetGame() {
        for _ in 0..<firstRoundCards {
            currentShowCards.append(cards.removeFirst())
        }
    }
    
    mutating func addThreeMoreCards() {
        if canAddMoreCards {
            for _ in 0..<3 {
                currentShowCards.append(cards.removeFirst())
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let index = currentShowCards.firstIndex(where: { $0.id == card.id }) {
            currentShowCards[index].isSelected.toggle()
            calculateSet()
        }
    }
    
    private mutating func calculateSet() {
        let potentialSet = currentShowCards.filter({ $0.isSelected })
        if potentialSet.count == 3 {
            let first = potentialSet[0]
            let second = potentialSet[1]
            let third = potentialSet[2]
            
            let shapeValidation = (first.shape == second.shape && second.shape == third.shape)
                || (first.shape != second.shape && first.shape != third.shape && second.shape != third.shape)
            let shadingValidation = (first.shading == second.shading && second.shading == third.shading)
                || (first.shading != second.shading && first.shading != third.shading && second.shading != third.shading)
            let quantityValidation = (first.quantity == second.quantity && second.quantity == third.quantity)
                || (first.quantity != second.quantity && first.quantity != third.quantity && second.quantity != third.quantity)
            let colorValidation = (first.color == second.color && second.color == third.color)
                || (first.color != second.color && first.color != third.color && second.color != third.color)
            
            if shapeValidation && shadingValidation && quantityValidation && colorValidation {
                correctlySets += 1
                potentialSet.forEach { card in
                    if let index = currentShowCards.firstIndex(where: { $0.id == card.id }) {
                        if index >= firstRoundCards {
                            currentShowCards.remove(at: index)
                        } else {
                            if currentShowCards.count > firstRoundCards {
                                currentShowCards[index] = currentShowCards.last!
                                currentShowCards.removeLast()
                            } else {
                                currentShowCards[index] = cards.removeFirst()
                            }
                        }
                    }
                }
            }
            for index in currentShowCards.indices {
                if currentShowCards[index].isSelected {
                    currentShowCards[index].isSelected.toggle()
                }
            }
        }
    }
    
    struct Card: Identifiable {
        var id: String = UUID().uuidString
        var shape: SetShape
        var shading: ShadingShape
        var color: Color
        var quantity: Int
        var isSelected: Bool = false
    }
}
