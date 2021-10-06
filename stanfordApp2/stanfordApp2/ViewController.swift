//
//  ViewController.swift
//  stanfordApp2
//
//  Created by Demir Dereli on 3.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class myView: UIView{
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        fatalError("lol")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let rectangle1 = CGRect(x: 0, y: 0, width: 200, height: 200)
        context.setFillColor(UIColor.systemRed.cgColor)
        context.fill(rectangle1)
    }
    
}
