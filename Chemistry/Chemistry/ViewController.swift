import UIKit

////////////////////////////////////////
//          Global Variables          //
////////////////////////////////////////

//SET VIEW - setImageView
var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
let setMaxImages = 1
var setImageIndex: NSInteger = 0

////////////////////////////////////////////////////////////
//                     ViewController                     //
////////////////////////////////////////////////////////////
class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // DRAW VIEW ///////////////////////////////////////////////
    
    //open camera button
    @IBAction func openCameraDrawView(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // HOME VIEW ////////////////////////////////////////////////
    
    //plus button
    @IBOutlet var plusButton: RoundButton!
    
    @IBAction func plusButtonPress(_ sender: AnyObject) {
        if (self.plusButton.isPressed) {
            self.plusButton.isPressed = false
            rotateButton(angle: (0.0), duration: 0.1, button: self.plusButton)
            fadeOutButton(duration: 0.1, button: self.cameraButton)
        } else {
            self.plusButton.isPressed = true
            rotateButton(angle: (Double.pi/4.0), duration: 0.1, button: self.plusButton)
            fadeInButton(duration: 0.1, button: self.cameraButton)
        }
    }
    
    //camera button
    @IBOutlet var cameraButton: CameraButton!

    @IBAction func openCameraHomeView(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // SET VIEW //////////////////////////////////////////////////
}

////////////////////////////////////////
//             Animations             //
////////////////////////////////////////

func rotateButton(angle: CGFloat, duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration) {
        button.transform = CGAffineTransform(rotationAngle: angle)
    }
}

func fadeInButton(duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration, animations: {
        button.alpha = 1.0
    })
    button.isEnabled = true
}

func fadeOutButton(duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration, animations: {
        button.alpha = 0.0
    })
    button.isEnabled = false
}

func shrinkAndGrowButton(duration: Double, button: UIButton) {
     UIView.animate(withDuration: duration, animations: {
     button.transform = CGAffineTransform(scaleX: 0.6, y:0.6)
     },
     completion:{_ in
     UIView.animate(withDuration: duration) {
     button.transform = CGAffineTransform.identity
     }
     })
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
        layer.shadowOpacity = 0.3
        
        //Rounded
        layer.cornerRadius = 2.5
    }
}

class CameraButton: UIButton {
    override func awakeFromNib() {
        alpha = 0.0
        isEnabled = false
        
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        
        //Rounded
        layer.cornerRadius = 2.5
    }
}

class ShadowLabel: UILabel {
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
    }
}

class ShadowNavBar: UINavigationBar {
    override func awakeFromNib() {
        //...

    }
}

class RoundButton: UIButton {
    var isPressed = false
    
    override func awakeFromNib() {
        //Make circular
        layer.cornerRadius = 0.5 * bounds.size.width
        
        //scale image size
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Give Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
    }
}

