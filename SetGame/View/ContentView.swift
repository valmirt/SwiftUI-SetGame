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
            
            VStack {
                HStack {
                    if viewModel.canAddMoreCards {
                        Button(action: {
                            viewModel.addThreeMoreCards()
                        }, label: { Text("Add 3 Cards") })
                    }
                    Spacer()
                    Button(action: {
                        viewModel.startNewGame()
                    }, label: { Text("New Game") })
                }
                .font(.system(size: 22, weight: .medium))
                .padding([.leading, .trailing, .top])
                
                Grid(viewModel.firstCards) { card in
                    CardView(card: card)
                        .padding(5)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.choose(card: card)
                            }
                        }
                }
                
                HStack {
                    Text("Deck: \(viewModel.deckCount)")
                    Spacer()
                    Text("Sets: \(viewModel.setsCount)")
                }
                .padding([.leading, .trailing, .bottom])
                .font(.system(size: 22, weight: .medium))
            }
            .foregroundColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}
