import UIKit

class CardViewController: ViewController {
    var cardView: UIView!
    var nameView: UIImageView!
    var moleculeView: UIImageView!
    
    var nameLabel: UILabel!
    
    var showingMolecule = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //se
        moleculeView = UIImageView(frame:CGRect(x:0,y:0,width:343, height:269))
        moleculeView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        moleculeView.image = UIImage(named: "IUPAC1")
        
        //Setting label up
        nameLabel = UILabel(frame:CGRect(x:0,y:0,width:343,height:269))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        nameLabel.font = UIFont(name: "Ubuntu", size: 20)
        nameLabel.text = "Serine"       //TO-DO: Katie pull from database
        
        let singleTap = UITapGestureRecognizer(target:self, action:#selector(self.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rect = CGRect(x:18, y:149, width:343, height:269)
        
        cardView = UIView(frame:rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(moleculeView)
        
        view.addSubview(cardView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tapped(){
        print("tapped")     //debugging
        if(showingMolecule){
            UIView.transition(from: moleculeView, to: nameLabel, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            showingMolecule = false
        }
        else{
            UIView.transition(from: nameLabel, to: moleculeView, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            showingMolecule = true
        }
    }

}
