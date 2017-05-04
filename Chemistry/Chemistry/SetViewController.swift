import UIKit

class SetViewController: ViewController{

    @IBOutlet var swipeView: UIImageView!
    @IBOutlet var moleculeName: ShadowLabel!
    @IBOutlet var moleculeNumber: UILabel!
    
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    var setImageIndex: NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.addTarget(self, action: #selector(self.swipedView))
        swipeView.addGestureRecognizer(swipeRight)
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.addTarget(self, action: #selector(self.swipedView))
        swipeView.addGestureRecognizer(swipeLeft)
        
        swipeView.isUserInteractionEnabled = true
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
                    swipeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    self.moleculeName.text = "     SERINE"
                    self.moleculeNumber.text = "1/2"
                }
                
            case UISwipeGestureRecognizerDirection.left:
                //let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view left", preferredStyle: UIAlertControllerStyle.alert)
                //tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                //self.present(tapAlert, animated: true, completion: nil)
                if (setImageIndex < setImageList.count - 1) {
                    setImageIndex += 1;
                    swipeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    self.moleculeName.text = "     BENZENE"
                    self.moleculeNumber.text = "2/2"
                }
            default:
                break
            }
        }
    }
}
