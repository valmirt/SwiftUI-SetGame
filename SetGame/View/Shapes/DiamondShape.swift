//
//  DiamondShape.swift
//  SetGame
//
//  Created by Valmir Junior on 16/04/21.
//

import SwiftUI

struct DiamondShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.maxY)
        let leading = CGPoint(x: rect.minX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.minY)
        let trailing = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        
        path.move(to: top)
        path.addLines([top, leading, bottom, trailing, top])
        
        return path
    }
}
