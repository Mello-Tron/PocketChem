import UIKit

class SetViewController: ViewController{
    //SET VIEW - swipable UIImageView
    @IBOutlet weak var swipeView: UIImageView!
    let swipeRec = UISwipeGestureRecognizer()
    
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    let setMaxImages = 1
    var setImageIndex: NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRec.addTarget(self, action: #selector(self.swipedView))
        swipeView.addGestureRecognizer(swipeRec)
        swipeView.isUserInteractionEnabled = true
    }
    
    func swipedView() {
        let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the swipe view", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
}
