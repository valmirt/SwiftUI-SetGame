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
                            withAnimation(.easeInOut(duration: 0.75)) {
                                viewModel.addThreeMoreCards()
                            }
                        }, label: { Text("Add 3 Cards") })
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.75)) {
                            viewModel.startNewGame()
                        }
                    }, label: { Text("New Game") })
                }
                .font(.system(size: 22, weight: .medium))
                .padding([.leading, .trailing, .top])
                
                Grid(viewModel.firstCards) { card in
                    CardView(card: card)
                        .padding(5)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.75)) {
                                viewModel.choose(card: card)
                            }
                        }
                        .transition(.move(edge: Edge.allCases.randomElement()!))
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
        .onAppear {
            withAnimation(.easeInOut(duration: 0.75)) {
                viewModel.startNewGame()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}
