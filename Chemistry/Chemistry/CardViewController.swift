import UIKit

class CardViewController: ViewController {
    var cardView: UIView!
    var nameView: UIImageView!
    var moleculeView: UIImageView!
    
    var nameLabel: UILabel!
    
    var showingMolecule = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        moleculeView = UIImageView(image: UIImage(named: "IUPAC1"))
        nameView = UIImageView(image: UIImage(named: "PocketProtector"))
        nameLabel = UILabel()
        
        
        let singleTap = UITapGestureRecognizer(target:self, action:#selector(self.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rect = CGRect(x:20, y:50, width:100, height:100)
        
        cardView = UIView(frame:rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(nameView)
        
        view.addSubview(cardView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tapped(){
        print("tapped")     //debugging
        if(showingMolecule){
            UIView.transition(from: moleculeView, to: nameView, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            showingMolecule = false
        }
        else{
            UIView.transition(from: nameView, to: moleculeView, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            showingMolecule = true
        }
    }

}
