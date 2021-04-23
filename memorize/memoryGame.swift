//
//  memoryGame.swift
//  memorize
//
//  Created by iresh sharma on 23/04/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numberOfPairs {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: (i*2) + 1))
        }
    }
    
    func choose(card: Card) {
        print("card choose \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
