import UIKit

class DrawViewController: ViewController {
    @IBOutlet var moleculeNumber: UILabel!
    @IBOutlet var moleculeName: UILabel!
    @IBOutlet var swipeLabel: ShadowLabel!
    @IBOutlet var navSetName: UINavigationItem!
    @IBOutlet var moleculeNumberTop: ShadowLabel!
    
    
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
        
        moleculeNumber.isHidden = true
        
        mySetManager.changeSet(_setID: databaseID)
        moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
        moleculeNumberTop.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
        moleculeName.text = mySetManager.getCurrentMoleculeName()
        
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
                if (mySetManager.changeMolecule(_shift: -1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    moleculeName.text = mySetManager.getCurrentMoleculeName()
                    moleculeNumberTop.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    //moleculeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
                
            case UISwipeGestureRecognizerDirection.left:
                if (mySetManager.changeMolecule(_shift: 1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    moleculeName.text = mySetManager.getCurrentMoleculeName()
                    moleculeNumberTop.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    //moleculeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
            default:
                break
            }
        }
    }
}
