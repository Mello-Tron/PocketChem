import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TESTING BY PRINTING DATABASE
        
        let marrMolInfo : NSMutableArray = DBManager().getAllData()
        let moleculeInfo : MoleculeInfo = marrMolInfo.object(at: 0) as! MoleculeInfo
        print ("Num: ", moleculeInfo.getImageNum(), "; Name: ", moleculeInfo.getMolName(), "; IUPAC: ", moleculeInfo.getMolIUPAC())
        
        //print(marrMolInfo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

////////////////Animations////////////////////

func rotateButton(angle: CGFloat, duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration) {
        button.transform = CGAffineTransform(rotationAngle: angle)
    }
}

func fadeInButton(duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration, animations: {
        button.alpha = 1.0
    })
    button.isEnabled = true
}

func fadeOutButton(duration: Double, button: UIButton) {
    UIView.animate(withDuration: duration, animations: {
        button.alpha = 0.0
    })
    button.isEnabled = false
}

func shrinkAndGrowButton(duration: Double, button: UIButton) {
     UIView.animate(withDuration: duration, animations: {
     button.transform = CGAffineTransform(scaleX: 0.6, y:0.6)
     },
     completion:{_ in
     UIView.animate(withDuration: duration) {
     button.transform = CGAffineTransform.identity
     }
     })
}
