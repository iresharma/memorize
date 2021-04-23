//
//  MemoryGameView.swift
//  memorize
//
//  Created by iresh sharma on 22/04/21.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack(alignment: .center, spacing: nil) {
            Text("Memorize, the game").bold().font(.largeTitle)
            HStack(alignment: .center, spacing: 10) {
                ForEach(viewModel.cards){ card in
                    if viewModel.len < 5 {
                        CardView(card: card).onTapGesture {
                            viewModel.chooseCard(card)
                        }
                    }
                    else {
                        CardView(card: card, font: .subheadline).onTapGesture {
                            viewModel.chooseCard(card)
                        }
                    }
                }
            }.foregroundColor(.orange)
        }.padding()
    }
}


// MARK: CardView
struct CardView: View {
    var card: MemoryGame<String>.Card
    var font: Font = .largeTitle
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 15.0).fill(Color.white)
                Text(card.content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15.0).fill()
            }
//                  The code underneath will create the desired look in light mode but F up in dark mode that's why we add the line above to fix it
            RoundedRectangle(cornerRadius: 15.0).stroke(lineWidth: 5)
        }.aspectRatio(0.6, contentMode: ContentMode.fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
