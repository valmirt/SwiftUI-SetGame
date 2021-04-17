//
//  CardView.swift
//  SetGame
//
//  Created by Valmir Junior on 17/04/21.
//

import SwiftUI

struct CardView: View {
    var card: SetGame.Card
    
    private var opacity: Double {
        switch card.shading {
        case .solid: return 1
        case .striped: return 0.4
        case .open: return 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeWidth)
                    .opacity(card.isSelected ? 1 : 0)
                VStack {
                    Group {
                        ForEach(0..<card.quantity) { _ in
                            ZStack {
                                switch card.shape {
                                case .diamond:
                                    if card.shading != .open { DiamondShape().opacity(opacity) }
                                    DiamondShape().stroke(lineWidth: edgeWidthShape)
                                case .rectangle:
                                    if card.shading != .open {
                                        RoundedRectangle(cornerRadius: 0).opacity(opacity)
                                    }
                                    RoundedRectangle(cornerRadius: 0).stroke(lineWidth: edgeWidthShape)
                                case .oval:
                                    if card.shading != .open { Capsule().opacity(opacity) }
                                    Capsule().stroke(lineWidth: edgeWidthShape)
                                }
                            }
                        }
                    }
                    .padding([.top, .bottom], 4)
                    .padding([.leading, .trailing])
                    .frame(height: geometry.size.height / 3.5)
                    .foregroundColor(card.color)
                }
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10
    private let edgeWidth: CGFloat = 4
    private let edgeWidthShape: CGFloat = 2
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGame.Card(shape: .diamond, shading: .striped, color: .blue, quantity: 3
        )
        CardView(card: card)
            .previewLayout(.fixed(width: 300, height: 450))
            .foregroundColor(.green)
            .padding(4)
    }
}
