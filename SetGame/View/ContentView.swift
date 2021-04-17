//
//  ContentView.swift
//  SetGame
//
//  Created by Valmir Junior on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DiamondShape()
                .stroke(lineWidth: 3)
                .foregroundColor(.blue)
                .frame(width: 300, height: 150)
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.orange)
                .opacity(0.4)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
            
            Capsule()
                .foregroundColor(.red)
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
