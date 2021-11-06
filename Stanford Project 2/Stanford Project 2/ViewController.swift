//
//  ViewController.swift
//  Stanford Project 2
//
//  Created by Demir Dereli on 18.10.2021.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet var playingCardView: PlayingCardView!{
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(gestureRecognizer:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        playingCardView.isFaceUp = !playingCardView.isFaceUp
    }
    
    @objc func nextCard(){
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1 ... 10{
            let card = deck.draw()!
            print("\(card)")
        }
    }



}
