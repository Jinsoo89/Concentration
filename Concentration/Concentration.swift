//
//  Concentration.swift
//  Concentration
//
//  Created by Jinsoo Choi on 27/12/2018.
//  Copyright © 2018 Jinsoo Choi. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOnlyOneFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
        for idx in 0..<cards.count {
            let randomNum = Int(arc4random_uniform(UInt32(cards.count)))
            
            let card = cards[idx]
            cards[idx] = cards[randomNum]
            cards[randomNum] = card
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyOneFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOnlyOneFaceUpCard = index
            }
        }
    }
}
