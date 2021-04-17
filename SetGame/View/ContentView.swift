//
//  ContentView.swift
//  SetGame
//
//  Created by Valmir Junior on 16/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            
            Grid(viewModel.firstCards) { card in
                CardView(card: card)
                    .padding(5)
            }
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}
