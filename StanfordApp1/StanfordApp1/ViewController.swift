//
//  ViewController.swift
//  StanfordApp1
//
//  Created by Demir Dereli on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🎃","👻","🎃","👻","💀","💀"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.firstIndex(of: sender)!
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }
    
    func flipCard (withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle(" ", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

