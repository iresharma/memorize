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
        cards = cards.shuffled()
    }
    
    func indexOf(of card: Card) -> Int {
        for i in 0..<cards.count {
            if cards[i].id == card.id {
                return i
            }
        }
        //        TODO: handle cannot find
        return 0
    }
    
//    MARK: Mutations
    mutating func choose(_ card: Card) {
        print("card choose \(card)")
        let chosenIndex: Int = indexOf(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    
//    MARK: Card model
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
