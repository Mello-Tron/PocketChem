import UIKit

class SetViewController: ViewController{

    @IBOutlet var navSetName: UINavigationItem!
    @IBOutlet var swipeView: UIImageView!
    @IBOutlet var moleculeName: ShadowLabel!
    @IBOutlet var moleculeNumber: UILabel!
    
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
        
        
        mySetManager.changeSet(_setID: self.databaseID)
        moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
        moleculeName.text = "     " + mySetManager.getCurrentMoleculeName()
        swipeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png")
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.addTarget(self, action: #selector(self.swipedView))
        swipeView.addGestureRecognizer(swipeRight)
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.addTarget(self, action: #selector(self.swipedView))
        swipeView.addGestureRecognizer(swipeLeft)
        
        swipeView.isUserInteractionEnabled = true
        
        //navSetName.title = mySetManager.getSetName()
    }
    
    func swipedView(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                if (mySetManager.changeMolecule(_shift: -1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    moleculeName.text = "     " + mySetManager.getCurrentMoleculeName()
                    swipeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
                
            case UISwipeGestureRecognizerDirection.left:
                if (mySetManager.changeMolecule(_shift: 1)) {
                    moleculeNumber.text = String(mySetManager.getCurrentMoleculeID() + 1) + "/" + String(mySetManager.getSetSize())
                    moleculeName.text = "     " + mySetManager.getCurrentMoleculeName()
                    swipeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png")
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
            default:
                break
            }
        }
    }
}
