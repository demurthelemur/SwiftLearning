//
//  ViewController.swift
//  Consoludation 4
//
//  Created by Demir Dereli on 13.12.2021.
//

import UIKit

class ViewController: UIViewController {
    //Game elements
    var health = 5{
        didSet{
            healthViewer.text = "Health: \(health)"
        }
    }
    var wordOptions = ["iron", "serra", "pen", "england", "germany", "pencil", "tank", "tenis", "brazil", "football", "keyboard", "swift"]
    var word = "" //change the word
    var letterCount = 0
    var wordLetters = [String]()
    
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    //array to create str
    var strArray = [String]()
    
    //string for word viewer label
    var str = ""{
        didSet{
            if str == word{
                str = "Game Over"
            }
        }
    }
    
    //UI Elements
    var healthViewer: UILabel!
    var wordViewer: UILabel!
    var currentAnswer: UITextField!
    var letterButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //select a random word at the start
        word = wordOptions.randomElement()!
        print(word)
        
        //create the string for word viewer
        letterCount = word.count
        
        for _ in 0..<letterCount{
            strArray.append(" _ ")
        }
        
        str = strArray.joined()
        
        //Seperate the characters of the word into an array
        for letter in word{
            wordLetters.append(String(letter))
        }
        
        //Basic View
        view = UIView()
        view.backgroundColor = .white
        
        //Health View
        healthViewer = UILabel()
        healthViewer.translatesAutoresizingMaskIntoConstraints = false
        healthViewer.textAlignment = .right
        healthViewer.text = "Health: \(health)"
        view.addSubview(healthViewer)
        
        //Word Viewer
        wordViewer = UILabel()
        wordViewer.translatesAutoresizingMaskIntoConstraints = false
        wordViewer.textAlignment = .center
        wordViewer.font = UIFont.systemFont(ofSize: 36)
        wordViewer.text = str
        view.addSubview(wordViewer)
        
        //Current Answer
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 26)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        //Submit Button
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        submit.layer.cornerRadius = 5
        submit.layer.borderWidth = 1
        submit.layer.borderColor = UIColor.blue.cgColor
        submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        view.addSubview(submit)
        
        //Clear Button
        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        clear.layer.cornerRadius = 5
        clear.layer.borderWidth = 1
        clear.layer.borderColor = UIColor.blue.cgColor
        clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        view.addSubview(clear)
        
        //Keyboard View
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        //Keyboard buttons
        let width = 150
        let height = 38
        var x = 0
        
        for row in 0..<13{
            for col in 0..<2{
                let letterButton = UIButton(type: .roundedRect)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("\(alphabet[x])", for: .normal)
                let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                letterButton.layer.cornerRadius = 5
                letterButton.layer.borderWidth = 1
                letterButton.layer.borderColor = UIColor.blue.cgColor
                buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                x+=1
            }
        }
        
        //Constraints
        NSLayoutConstraint.activate([
              healthViewer.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
              healthViewer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
              wordViewer.topAnchor.constraint(equalTo: healthViewer.bottomAnchor, constant: 40),
              wordViewer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 50),
              currentAnswer.topAnchor.constraint(equalTo: wordViewer.bottomAnchor, constant: 40),
              currentAnswer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 70),
              submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 20),
              submit.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30),
              submit.heightAnchor.constraint(equalToConstant: 35),
              submit.widthAnchor.constraint(equalToConstant: 150),
              clear.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 20),
              clear.leadingAnchor.constraint(equalTo: submit.trailingAnchor),
              clear.heightAnchor.constraint(equalToConstant: 35),
              clear.widthAnchor.constraint(equalToConstant: 150),
              buttonsView.widthAnchor.constraint(equalToConstant: 300),
              buttonsView.heightAnchor.constraint(equalToConstant: 500),
              buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
              buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
              
          ])
    }
    
    @objc func letterTapped(_ sender: UIButton){
        currentAnswer.text = sender.currentTitle
    }
    
    @objc func submitTapped(_ sender: UIButton){
        if let currentGuess = currentAnswer.text{
            if wordLetters.contains(currentGuess){
                var index = 0
                for letter in word{
                    if String(letter) == currentGuess{
                        strArray[index] = currentGuess
                        str = strArray.joined()
                        labelStringChanged(str)
                        index+=1
                    } else{
                        index+=1
                    }
                }
                currentAnswer.text = ""
            }else{
                currentAnswer.text = ""
                health-=1
            }
        }
        
    }
    
//restarts the game
    @objc func clearTapped(){
        str = ""
        strArray = []
        
        word = wordOptions.randomElement()!
        letterCount = word.count
        
        print(word)
        
        for _ in 0..<letterCount{
            strArray.append(" _ ")
        }
        
        str = strArray.joined()
        labelStringChanged(str)
    }
    
    func labelStringChanged(_ newValue: String){
        wordViewer.text = newValue
    }
}



