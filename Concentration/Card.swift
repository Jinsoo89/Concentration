//
//  Card.swift
//  Concentration
//
//  Created by Jinsoo Choi on 27/12/2018.
//  Copyright © 2018 Jinsoo Choi. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        
        return identifierFactory
    }
}
