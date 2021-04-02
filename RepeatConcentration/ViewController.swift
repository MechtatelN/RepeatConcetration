//
//  ViewController.swift
//  RepeatConcentration
//
//  Created by Maria Volkova on 3/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcetrationGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0{
        didSet{
            labelTouches.text = "Touches: \(touches)"
        }
    }
    
    private var emojiCollection = ["🦆", "🦋", "🕷", "🕸", "🦈", "🐋", "🦅", "🦕","🦖"]
    
    private var emojiDictionary = [Card:String]()
    
    private func emojiJoin(for card: Card) -> String{
        if emojiDictionary[card] == nil{
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emojiJoin(for: card), for: .normal)
            }else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0) : #colorLiteral(red: 0.009989308193, green: 0.535962522, blue: 0.3559766412, alpha: 1)
                button.setTitle("", for: .normal)
            }
        }
    }

    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var labelTouches: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(index: buttonIndex)
            updateViewFromModel()
        }
    }
    
    
}

extension Int{
    var arc4randomExtension: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
