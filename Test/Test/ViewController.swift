//
//  ViewController.swift
//  Test
//
//  Created by Demir Dereli on 19.10.2021.
//



import UIKit

class viewController: UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRectangle()
    }
    
    func drawRectangle(){
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image{ ctx in
            let rectangle = CGRect(x: 5, y: 5, width: 502, height: 502)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }

}
