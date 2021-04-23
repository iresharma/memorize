//
//  emojiMemoryGame.swift
//  memorize
//
//  Created by iresh sharma on 23/04/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
//  private(set) means only this class can set the model but everyone can view it
//  private(set) var model: MemoryGame<String>
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🚀", "🗺", "🔥", "👩🏻‍🎨", "💻", "🧠"]
        return MemoryGame<String>.init(numberOfPairs: Int.random(in: 2..<6)) { index in emojis[index] }
    }
    
//    MARK: Getters
    
//    var cards is now acting as a getter
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var len: Int {
        model.cards.count
    }
    
//     MARK: Intent(s)
    
    func chooseCard(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
