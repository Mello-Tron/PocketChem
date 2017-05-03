import UIKit

class SetViewController: ViewController{
    //SET VIEW - swipable UIImageView
    @IBOutlet weak var swipeView: UIImageView!
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    let setMaxImages = 1
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
                let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view right", preferredStyle: UIAlertControllerStyle.alert)
                tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                self.present(tapAlert, animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.left:
                let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view left", preferredStyle: UIAlertControllerStyle.alert)
                tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                self.present(tapAlert, animated: true, completion: nil)
            default:
                break
            }
        }
    }
}
