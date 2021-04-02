//
//  Cards.swift
//  RepeatConcentration
//
//  Created by Maria Volkova on 3/22/21.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    
    var isMatched : Bool = false
    var isFaceUp : Bool = false
    private var identifier: Int
    
    private static var identifierNumber = 0
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
