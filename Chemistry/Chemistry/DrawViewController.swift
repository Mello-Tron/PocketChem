import UIKit

class DrawViewController: ViewController {
    @IBOutlet var moleculeNumber: UILabel!
    @IBOutlet var moleculeName: UILabel!
    @IBOutlet var swipeLabel: ShadowLabel!
    
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    var setImageIndex: NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.addTarget(self, action: #selector(self.swipedView))
        swipeLabel.addGestureRecognizer(swipeRight)
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.addTarget(self, action: #selector(self.swipedView))
        swipeLabel.addGestureRecognizer(swipeLeft)
        
        swipeLabel.isUserInteractionEnabled = true
    }
    
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
    
    @IBAction func openCameraRoll(_ sender: AnyObject) {
        let tapAlert = UIAlertController(title: "Correct", message: "Nice Job!", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
    
    func swipedView(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                //let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view right", preferredStyle: UIAlertControllerStyle.alert)
                //tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                //self.present(tapAlert, animated: true, completion: nil)
                if (setImageIndex > 0) {
                    setImageIndex -= 1;
                    //swipeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    self.moleculeName.text = "s e r i n e"
                    self.moleculeNumber.text = "1/2"
                }
                
            case UISwipeGestureRecognizerDirection.left:
                //let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view left", preferredStyle: UIAlertControllerStyle.alert)
                //tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                //self.present(tapAlert, animated: true, completion: nil)
                if (setImageIndex < setImageList.count - 1) {
                    setImageIndex += 1;
                    //swipeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    self.moleculeName.text = "b e n z e n e"
                    self.moleculeNumber.text = "2/2"
                }
            default:
                break
            }
        }
    }
}
