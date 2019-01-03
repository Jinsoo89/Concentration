//
//  Concentration.swift
//  Concentration
//
//  Created by Jinsoo Choi on 27/12/2018.
//  Copyright © 2018 Jinsoo Choi. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOnlyOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
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
    
    mutating func chooseCard(at index: Int) {
        // assertion to avoid crash of index out of range
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyOneFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOnlyOneFaceUpCard = index
            }
        }
    }
}
