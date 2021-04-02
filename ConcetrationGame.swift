//
//  ConcetrationGame.swift
//  RepeatConcentration
//
//  Created by Maria Volkova on 3/22/21.
//

import Foundation

class ConcetrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard:Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(index: Int) {
        
        guard !cards[index].isMatched else {
         return
        }
        
        if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
            if cards[matchingIndex] == cards[index]{
                cards[matchingIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
        }else{
            indexOfOneAndOnlyFaceUpCard = index
            
        }
    }
    
//    func chooseCard(index: Int) {
//        if !cards[index].isMatched{
//            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
//                if cards[matchingIndex].identifier == cards[index].identifier{
//                    cards[matchingIndex].isMatched = true
//                    cards[index].isMatched = true
//                }
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
//            }else{
//                for flipDown in cards.indices{
//                    cards[flipDown].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = index
//
//            }
//        }
//    }
        
    
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationGame.init(\(numberOfPairsOfCards): must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
}
