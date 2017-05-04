//
//  MoleculeInfo.swift
//  PocketChem
//
//  Created by Kaitlyn J Shaw on 5/3/17.
//  Copyright © 2017 bleh. All rights reserved.
//

import UIKit

class MoleculeInfo: NSObject {
    
    var cid: Int = Int()
    var name: String = String()
    var IUPAC: String = String()
    
    func getImageNum() -> Int
    {
        return cid
    }
    
    func getMolName() -> String
    {
        return name
    }
    
    func getMolIUPAC() -> String
    {
        return IUPAC
    }
    
}
