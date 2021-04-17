//
//  CardView.swift
//  SetGame
//
//  Created by Valmir Junior on 17/04/21.
//

import SwiftUI

struct CardView: View {
    var setShape: SetShape
    var shading: ShadingShape
    var color: Color
    var quantity: Int
    
    private var opacity: Double {
        switch shading {
        case .solid: return 1
        case .striped: return 0.4
        case .open: return 0
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(lineWidth: edgeWidth)
            VStack {
                Group {
                    if shading == .open {
                        ForEach(0..<quantity) { _ in
                            switch setShape {
                            case .diamond: DiamondShape().stroke(lineWidth: edgeWidth)
                            case .rectangle: RoundedRectangle(cornerRadius: 0).stroke(lineWidth: edgeWidth)
                            case .oval: Capsule().stroke(lineWidth: edgeWidth)
                            }
                        }
                    } else {
                        ForEach(0..<quantity) { _ in
                            switch setShape {
                            case .diamond: DiamondShape().opacity(opacity)
                            case .rectangle: RoundedRectangle(cornerRadius: 0).opacity(opacity)
                            case .oval: Capsule().opacity(opacity)
                            }
                        }
                    }
                }
                .frame(height: maxHeightShape)
                .foregroundColor(color)
                .padding()
            }
        }
    }
    
    private let maxHeightShape: CGFloat = 110
    private let cornerRadius: CGFloat = 10
    private let edgeWidth: CGFloat = 3
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(setShape: .diamond, shading: .open, color: .blue, quantity: 1)
            .previewLayout(.fixed(width: 300, height: 450))
            .foregroundColor(.green)
            .padding(4)
    }
}
