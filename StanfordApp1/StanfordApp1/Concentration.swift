//
//  Concentration.swift
//  StanfordApp1
//
//  Created by Demir Dereli on 30.09.2021.
//

import Foundation

class Concentration{
    var cards: Array<Card> = []
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        // TODO: Shuffle the cards
    
    }
}
