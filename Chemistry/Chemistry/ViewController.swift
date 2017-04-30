//
//  ViewController.swift
//

import UIKit

////////////////////////////////////////
//           ViewController           //
////////////////////////////////////////
// Make sure this is the class for every
// view in our project (option can be
// found in the storyboard).

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    let reuseIdentifier = "cell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func openCameraIdentifyView(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openCameraDrawView(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func butonPressed(_ sender: RoundButton){
        let button = RoundButton()
        
        //Animate rorate button on touch
        UIView.animate(withDuration: 3.0) {
            button.self.transform = CGAffineTransform(rotationAngle: (CGFloat(M_PI)))
        }
        
        //Make button grow then go back to normal
        UIView.animate(withDuration: 0.6, animations: {
            button.self.transform = CGAffineTransform(scaleX: 0.6, y:0.6)
        },
                       completion:{_ in
                        UIView.animate(withDuration: 0.6) {
                            button.self.transform = CGAffineTransform.identity
                        }
        })
    }
    
    
}

////////////////////////////////////////
//             UI Classes             //
////////////////////////////////////////

class ShadowButton: UIButton {
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.1
        
        //Rounded
        layer.cornerRadius = 5
    }
}

class ShadowLabel: UILabel {
    override func awakeFromNib() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.1
    }
}

class ShadowNavBar: UINavigationBar {
    override func awakeFromNib() {
        //...

    }
}

class RoundButton: UIButton {
    override func awakeFromNib() {
        //Make circular
        layer.cornerRadius = 0.5 * bounds.size.width
        
        //scale image size
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        addTarget(self, action: #selector(buttonPressed), for: UIControlEvents.touchUpInside)
        
        //Give Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.1
    }
    func buttonPressed(){
        print("work?")
        
        //Animate rorate button on touch
        UIView.animate(withDuration: 3.0) {
            self.transform = CGAffineTransform(rotationAngle: (CGFloat(M_PI)))
        }
        
        //Make button grow then go back to normal
        UIView.animate(withDuration: 0.6, animations: {
            self.transform = CGAffineTransform(scaleX: 0.6, y:0.6)
        },
                       completion:{_ in
                        UIView.animate(withDuration: 0.6) {
                            self.transform = CGAffineTransform.identity
                        }
        })
        
        
    }
    

}

