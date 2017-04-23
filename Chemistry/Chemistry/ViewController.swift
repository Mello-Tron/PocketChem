//
//  ViewController.swift
//  Chemistry
//
//  Created by Kaitlyn Duarte on 4/11/17.
//  Copyright © 2017 bleh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var studySetsButton: UIButton!
    @IBOutlet var identifyButton: UIButton!
    @IBOutlet var challengeButton: UIButton!
    @IBOutlet var cardsButton: UIButton!
    @IBOutlet var quizButton: UIButton!
    @IBOutlet var drawButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Patrick: I'm sure there is a better way to do this,
        //but until then...
        if (studySetsButton != nil) {
            setShadowButton(button: studySetsButton)
        }
        if (identifyButton != nil) {
            setShadowButton(button: identifyButton)
        }
        if (challengeButton != nil) {
            setShadowButton(button: challengeButton)
        }
        
        //Kat: I believe we could implement a switch to do this more effectively but for quick coding....
        //ERROR: This is not communicating to storyboard
        if (cardsButton != nil) {
            setShadowButton(button: cardsButton)
        }
        if (quizButton != nil) {
            setShadowButton(button: quizButton)
        }
        if (drawButton != nil) {
            setShadowButton(button: drawButton)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //Identify Button, click causes camera to open
    @IBAction func openCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func setShadowButton(button: UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.1
    }
}

