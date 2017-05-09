import UIKit

class CardViewController: ViewController {
    @IBOutlet var moleculeNumber: UILabel!
    @IBOutlet var containerView: UIView!
    
    
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
    var setImageList:[String] = ["IUPAC1@0.5x", "IUPAC2@0.5x"]
    var setImageIndex: NSInteger = 0
    
    let setInfo : NSMutableArray = DBManager().getASet(num: 1) // set parameter to whatever set you want
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting image up
        moleculeView = UIImageView(frame:CGRect(x:0,y:0,width:335, height:270))
        moleculeView.backgroundColor = UIColor(red: 255, green:255, blue: 255, alpha: 1)
        moleculeView.image = UIImage(named: "IUPAC1")
        
        //Setting label up
        nameLabel = UILabel(frame:CGRect(x:0,y:0,width:335,height:270))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        nameLabel.font = UIFont(name: "Ubuntu", size: 20)
        //nameLabel.text = getSetInfo().      //TO-DO: Katie pull from database
        
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
            UIView.transition(from: flagSelected, to: flagUnselected, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, completion: nil)
            flagged = false
            
        }
        else{
            UIView.transition(from: flagUnselected, to: flagSelected, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, completion: nil)
            flagged = true
            
        }
        
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
                    moleculeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    //self.moleculeName.text = "     SERINE"
                    nameLabel.text = "Serine"
                    self.moleculeNumber.text = "1/2"
                }
                
            case UISwipeGestureRecognizerDirection.left:
                //let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the view left", preferredStyle: UIAlertControllerStyle.alert)
                //tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                //self.present(tapAlert, animated: true, completion: nil)
                if (setImageIndex < setImageList.count - 1) {
                    setImageIndex += 1;
                    moleculeView.image = UIImage(named: setImageList[setImageIndex])
                    
                    //Jimmy-rigged code
                    //self.moleculeName.text = "     BENZENE"
                    nameLabel.text = "Benzene"
                    self.moleculeNumber.text = "2/2"
                }
            default:
                break
            }
        }
    }
}
