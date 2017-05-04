import UIKit

class CardViewController: ViewController {
    var cardView: UIView!
    var nameView: UIImageView!
    var moleculeView: UIImageView!
    
    var flagView: UIView!
    var flagSelected: UIImageView!
    var flagUnselected: UIImageView!
    
    var nameLabel: UILabel!
    
    var showingMolecule = true
    var flagged = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting image up
        moleculeView = UIImageView(frame:CGRect(x:0,y:0,width:375, height:270))
        moleculeView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        moleculeView.image = UIImage(named: "IUPAC1")
        
        //Setting label up
        nameLabel = UILabel(frame:CGRect(x:0,y:0,width:375,height:270))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        nameLabel.font = UIFont(name: "Ubuntu", size: 20)
        nameLabel.text = "Serine"       //TO-DO: Katie pull from database
        
        //create a recognizer for user touch
        let singleTap = UITapGestureRecognizer(target:self, action:#selector(self.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rect = CGRect(x:18, y:149, width:375, height:270)
        
        cardView = UIView(frame:rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(moleculeView)
        
        view.addSubview(cardView)
        
        //Setting flag up
        flagSelected = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 40))
        flagUnselected = UIImageView(frame:CGRect(x: 0, y: 0, width: 30, height: 40))
        flagSelected.image = UIImage(named: "FlagSelected")
        flagUnselected.image = UIImage(named: "FlagUnselected")
        
        let singleGrow = UITapGestureRecognizer(target: self, action: #selector(self.grow))
        singleGrow.numberOfTapsRequired = 1
        
        let flagArea = CGRect(x: 365, y: 450, width: 30, height:40)
        
        flagView = UIView(frame:flagArea)
        flagView.addGestureRecognizer(singleGrow)
        flagView.isUserInteractionEnabled = true
        flagView.addSubview(flagSelected)
        
        view.addSubview(flagView)
        
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

}
