//
//  SettingsViewController.swift
//  PocketChem
//
//  Created by Kaitlyn J Shaw on 5/4/17.
//  Copyright © 2017 bleh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRandomImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadRandomImage()
    {
        let marrMolInfo : NSMutableArray = DBManager().getAllData()
        let randomIndex = Int(arc4random_uniform(UInt32(marrMolInfo.count)))
        
        //numString = marrMolInfo[randomIndex].getName() as! String
        
        // the random molecule from the array:
        let moleculeInfo : MoleculeInfo = marrMolInfo.object(at: randomIndex) as! MoleculeInfo
        
        // getting the molecule id number and converting it to a string to identify the name of the image
        let x : Int = moleculeInfo.getImageNum()
        let xNumber = x as NSNumber
        let numString : String = xNumber.stringValue
        
        
        imageView.image = UIImage(named: numString)
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
     
     
     
     let url = NSURL(string:"/Users/kshaw17/Documents/ChemStudyApp/Chemistry/Chemistry/database/images/11.png")
     var data = NSData(contentsOf:url! as URL)
     if data! == nil {
     imageURL.image = UIImage(data:data! as Data)
     }
    */

}
