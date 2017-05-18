import UIKit

class HomeViewController: ViewController {
    //plus button
    @IBOutlet var plusButton: RoundButton!
    @IBOutlet var alkanesButton: ShadowButton!
    @IBOutlet var alkenesButton: ShadowButton!
    @IBOutlet var alcoholsButton: ShadowButton!
    @IBOutlet var benzeneButton: ShadowButton!
    
    
    @IBAction func alkanesButtonPress(_ sender: Any) {
        self.databaseID = 1
    }
    
    @IBAction func alkenesButtonPress(_ sender: Any) {
        self.databaseID = 2
    }
    
    @IBAction func alcoholsButtonPress(_ sender: Any) {
        self.databaseID = 3
    }
    
    @IBAction func benzeneButton(_ sender: Any) {
        self.databaseID = 4
    }
    
    @IBAction func plusButtonPress(_ sender: AnyObject) {
        if (self.plusButton.isPressed) {
            self.plusButton.isPressed = false
            rotateButton(angle: (0.0), duration: 0.1, button: self.plusButton)
            fadeOutButton(duration: 0.1, button: self.cameraButton)
        } else {
            self.plusButton.isPressed = true
            rotateButton(angle: (CGFloat(Double.pi/4.0)), duration: 0.1, button: self.plusButton)
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
}
