//
//  imageViewController.swift
//  HerOApp3
//
//  Created by moran levi on 29/06/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
   
    let actor = Actor?.self
    var pic = UIImage()
    var receivedImage : UIImage?
    var scroolView = UIScrollViewDelegate.self
    

    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func backBtn(_ sender: UIButton) {
        let backVC = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        self.present(backVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = pic
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        view.addGestureRecognizer(pinch)
    
    
 }

    @objc func handlePinch(sender: UIPinchGestureRecognizer){
        guard sender.view != nil else { return }
        
        if sender.state == .began || sender.state == .changed{
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            
            
            sender.scale = 1.0
            
            
        }
 
    }

}
