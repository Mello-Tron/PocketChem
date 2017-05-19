import UIKit

class QuizViewController: ViewController, UITextFieldDelegate {
    @IBOutlet var swipeLabel: ShadowUIImageView!
    @IBOutlet var moleculeNumber: UILabel!
    @IBOutlet var userAnswer: UITextField!
    @IBOutlet var navSetName: UINavigationItem!
    
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    var setImageIndex: NSInteger = 0
    
    let mySetManager = SetManager(_setID: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hard Coded for now
        if (self.databaseID == 1) {
            navSetName.title = "ALKANES" }
        else if (self.databaseID == 2) {
            navSetName.title = "ALKENES" }
        else if (self.databaseID == 3) {
            navSetName.title = "ALCOHOLS" }
        else if (self.databaseID == 4) {
            navSetName.title = "BENZENE" }
        
        userAnswer.becomeFirstResponder()
        userAnswer.returnKeyType = UIReturnKeyType.done
        
        userAnswer.autocorrectionType = .no
        //userAnswer.enablesReturnKeyAutomatically = false
        
        mySetManager.changeSet(_setID: databaseID)
        moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
        swipeLabel.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png")
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.addTarget(self, action: #selector(self.swipedView))
        swipeLabel.addGestureRecognizer(swipeRight)
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.addTarget(self, action: #selector(self.swipedView))
        swipeLabel.addGestureRecognizer(swipeLeft)
        
        swipeLabel.isUserInteractionEnabled = true
    }
    
    @IBAction func userClicksEnter(_ sender: Any) {
        var textAnswer = userAnswer.text
        textAnswer = textAnswer?.lowercased()
        
        if (textAnswer == mySetManager.getCurrentMoleculeName()) {
            let myMessage = "Correct!"
            
            let alert = UIAlertController(title: "Alert", message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let myMessage = "Incorrect!"
            
            let alert = UIAlertController(title: "Alert", message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func swipedView(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                if (mySetManager.changeMolecule(_shift: -1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    //moleculeName.text = mySetManager.getCurrentMoleculeName()
                    swipeLabel.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
                
            case UISwipeGestureRecognizerDirection.left:
                if (mySetManager.changeMolecule(_shift: 1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    //moleculeName.text = mySetManager.getCurrentMoleculeName()
                    swipeLabel.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
            default:
                break
            }
        }
    }
}
