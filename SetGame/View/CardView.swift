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
                VStack {
                    Group {
                        if card.shading == .open {
                            ForEach(0..<card.quantity) { _ in
                                switch card.shape {
                                case .diamond: DiamondShape().stroke(lineWidth: edgeWidth)
                                case .rectangle: RoundedRectangle(cornerRadius: 0).stroke(lineWidth: edgeWidth)
                                case .oval: Capsule().stroke(lineWidth: edgeWidth)
                                }
                            }
                        } else {
                            ForEach(0..<card.quantity) { _ in
                                switch card.shape {
                                case .diamond: DiamondShape().opacity(opacity)
                                case .rectangle: RoundedRectangle(cornerRadius: 0).opacity(opacity)
                                case .oval: Capsule().opacity(opacity)
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
    private let edgeWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetGame.Card(shape: .diamond, shading: .open, color: .blue, quantity: 3
        )
        CardView(card: card)
            .previewLayout(.fixed(width: 300, height: 450))
            .foregroundColor(.green)
            .padding(4)
    }
}
