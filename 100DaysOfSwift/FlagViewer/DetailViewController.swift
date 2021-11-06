//
//  DetailViewController.swift
//  FlagViewer
//
//  Created by Demir Dereli on 6.11.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToBeLoaded = selectedImage{
            imageView.image = UIImage(named: imageToBeLoaded)
        }
        title = selectedImage!
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(ShareTapped))
    }
    
    @objc func ShareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("Image not found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
