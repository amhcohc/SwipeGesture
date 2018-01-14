//
//  ViewController.swift
//  SwifeGesture
//
//  Created by Yang Hyeon Gyu on 2018. 1. 14..
//  Copyright © 2018년 Yang Hyeon Gyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let numOfTouches = 2
    
    @IBOutlet var imageViewUp: UIImageView!
    @IBOutlet var imageViewLeft: UIImageView!
    @IBOutlet var imageViewRight: UIImageView!
    @IBOutlet var imageViewDown: UIImageView!
    
    var imageLeft = [UIImage]()
    var imageRight = [UIImage]()
    var imageUp = [UIImage]()
    var imageDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageUp.append(UIImage(named: "arrow-up-black.png")!)
        imageUp.append(UIImage(named: "arrow-up-red.png")!)
        imageDown.append(UIImage(named: "arrow-down-black.png")!)
        imageDown.append(UIImage(named: "arrow-down-red.png")!)
        imageLeft.append(UIImage(named: "arrow-left-black.png")!)
        imageLeft.append(UIImage(named: "arrow-left-red.png")!)
        imageRight.append(UIImage(named: "arrow-right-black.png")!)
        imageRight.append(UIImage(named: "arrow-right-red.png")!)
        
        imageViewUp.image = imageUp[0]
        imageViewDown.image = imageDown[0]
        imageViewLeft.image = imageLeft[0]
        imageViewRight.image = imageRight[0]
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        swipeUp.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        swipeDown.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.numberOfTouchesRequired = numOfTouches
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imageViewUp.image = imageUp[0]
            imageViewDown.image = imageDown[0]
            imageViewLeft.image = imageLeft[0]
            imageViewRight.image = imageRight[0]
            
            switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.up:
                    imageViewUp.image = imageUp[1]
                case UISwipeGestureRecognizerDirection.down:
                    imageViewDown.image = imageDown[1]
                case UISwipeGestureRecognizerDirection.left:
                    imageViewLeft.image = imageLeft[1]
                case UISwipeGestureRecognizerDirection.right:
                    imageViewRight.image = imageRight[1]
                default:
                    break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

