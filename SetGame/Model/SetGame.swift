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
    private(set) var cards: [Card]
    
    init() {
        cards = []
        startSetDeck()
        cards.shuffle()
    }
    
    private mutating func startSetDeck() {
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
                        var color = Color.blue
                        switch colorIndex {
                        case 2: color = .yellow
                        case 3: color = .pink
                        default: break
                        }
                        cards.append(Card(shape: shape, shading: shading, color: color, quantity: index))
                    }
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
    }
}
