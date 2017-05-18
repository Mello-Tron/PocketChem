import UIKit

class CardViewController: ViewController {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var overviewLabel: textUpdate!
    
    
    var cardView: UIView!
    //var nameView: UIImageView!
    var moleculeView: UIImageView!
    
    var flagView: UIView!
    var flagSelected: UIImageView!
    var flagUnselected: UIImageView!
    
    var numberLabel: UILabel!
    var numberView: UIView!
    
    var nameLabel: UILabel!
    
    var showingMolecule = true
    var flagged = true
    
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    
    let setInfo : NSMutableArray = DBManager().getASet(num: 1) // set parameter to whatever set you want
    
    let mySetManager = SetManager(_setID: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySetManager.changeSet(_setID: databaseID)
        overviewLabel.setSetSize(size: mySetManager.getSetSize())
        overviewLabel.updateMoleculeNumber(newMoleculeNumber: mySetManager.getCurrentMoleculeID())
        
        //Setting image up
        moleculeView = UIImageView(frame:CGRect(x:0,y:0,width:335, height:270))
        moleculeView.backgroundColor = UIColor(red: 255, green:255, blue: 255, alpha: 1)
        moleculeView.image = UIImage(named: "IUPAC1")
        
        //Setting label up
        nameLabel = UILabel(frame:CGRect(x:0,y:0,width:335,height:270))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        nameLabel.font = UIFont(name: "Ubuntu", size: 20)
        //nameLabel.text = String(sharedInstance.getSetSize(setNum: 0))     //TO-DO: Katie pull from database
        
        nameLabel.text = mySetManager.getCurrentMoleculeName()
        moleculeView.image = UIImage(named: String(mySetManager.getCurrentMoleculeID() + 1) + ".png")
        
        
        //create a recognizer for user touch
        let singleTap = UITapGestureRecognizer(target:self, action:#selector(self.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rect = CGRect(x:18, y:120, width:335, height:270)
        
        cardView = UIView(frame:rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(moleculeView)
        
        containerView.addSubview(cardView)
        
        //Setting flag up
        flagSelected = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 40))
        flagUnselected = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 40))
        flagSelected.image = UIImage(named: "FlagSelected")
        flagUnselected.image = UIImage(named: "FlagUnselected")
        
        let singleGrow = UITapGestureRecognizer(target: self, action: #selector(self.grow))
        singleGrow.numberOfTapsRequired = 1
        
        let flagArea = CGRect(x: 325, y: 425, width: 30, height:40)
        
        flagView = UIView(frame:flagArea)
        flagView.addGestureRecognizer(singleGrow)
        flagView.isUserInteractionEnabled = true
        flagView.addSubview(flagSelected)
        
        containerView.addSubview(flagView)
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.addTarget(self, action: #selector(self.swipedView))
        cardView.addGestureRecognizer(swipeRight)
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeLeft.addTarget(self, action: #selector(self.swipedView))
        cardView.addGestureRecognizer(swipeLeft)
        
        cardView.isUserInteractionEnabled = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapped(){
        print("Card tapped")     //debugging
        if(showingMolecule){
            UIView.transition(from: moleculeView, to: nameLabel, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            showingMolecule = false
        }
        else{
            UIView.transition(from: nameLabel, to: moleculeView, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            showingMolecule = true
        }
    }
    
    func grow(){
        print("flag tapped")
        if(flagged){
            UIView.transition(from: flagSelected, to: flagUnselected, duration: 0.1, options: UIViewAnimationOptions.transitionCrossDissolve, completion: nil)
            flagged = false
            
        }
        else{
            UIView.transition(from: flagUnselected, to: flagSelected, duration: 0.1, options: UIViewAnimationOptions.transitionCrossDissolve, completion: nil)
            flagged = true
            
        }
        
    }
    
    func swipedView(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                if (mySetManager.changeMolecule(_shift: -1)) {
                    overviewLabel.updateMoleculeNumber(newMoleculeNumber: mySetManager.getCurrentMoleculeID())
                    nameLabel.text = mySetManager.getCurrentMoleculeName()
                    moleculeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png") // took out "+1" because using the molecule image ID insted of currentMoleculeID
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
                
            case UISwipeGestureRecognizerDirection.left:
                if (mySetManager.changeMolecule(_shift: 1)) {
                    overviewLabel.updateMoleculeNumber(newMoleculeNumber: mySetManager.getCurrentMoleculeID())
                    nameLabel.text = mySetManager.getCurrentMoleculeName()
                    moleculeView.image = UIImage(named: String(mySetManager.getMoleculeImageNum()) + ".png")
                    print ("Current ID: ", mySetManager.getCurrentMoleculeID())
                    print ("Current imageID: ", mySetManager.getMoleculeImageNum())
                }
            default:
                break
            }
        }
    }
}
