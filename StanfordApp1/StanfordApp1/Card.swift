//
//  Card.swift
//  StanfordApp1
//
//  Created by Demir Dereli on 30.09.2021.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory;
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier();
    }
}
