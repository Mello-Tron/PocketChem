//
//  Seque.swift
//  PocketChem
//
//  Created by Patrick Herbert on 5/18/17.
//  Copyright © 2017 bleh. All rights reserved.
//

import UIKit

class passIDSegue : UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        
        let currentView = source as! ViewController
        let nextView = destination as! ViewController
        nextView.databaseID = currentView.databaseID
    }
}
