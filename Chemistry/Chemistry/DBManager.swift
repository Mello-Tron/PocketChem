//
//  DBManager.swift
//  PocketChem
//
//  Created by Kaitlyn J Shaw on 5/3/17.
//  Copyright © 2017 bleh. All rights reserved.
//

// Here is the tutorial that I referenced for most of the coding I've done: http://www.theappguruz.com/blog/use-sqlite-database-swift
// Another source referenced: http://www.appcoda.com/fmdb-sqlite-database/

import UIKit
import Foundation

let sharedInstance = DBManager()

class DBManager: NSObject {
    
    //var database: FMDatabase? = nil // the first way of declaring the database. I think the nil is the problem, but if we take that off, it has the same error.
    
    static let shared: DBManager = DBManager() // the second way. both have the same error
    private let dbFileName = "mol.db"
    //private var database:FMDatabase!
    //var database = FMDatabase(path: "/Users/kduarte17/ChemStudyApp/Chemistry/Chemistry/database/mol.db") // HARD CODED PATH
    var database = FMDatabase(path: "/Users/kshaw17/Documents/ChemStudyApp/Chemistry/Chemistry/databaseInProject/mol.db") // HARD CODED PATH
    
    class func getInstance() -> DBManager // Here is the problem child. I read in a thread that "getInstance" is inadvisable and that sharedInstance should be a static property of the class...? Possibly a solution but unsure how to implement
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Utility.getPath(fileName: "mol.db"))
            print(Utility.getPath(fileName: "mol.db"))
        }
        return sharedInstance
    }
    
    
    
    func getAllData() -> NSMutableArray // The important method that should retrieve data into array
    {
        sharedInstance.database!.open() // Here is where the run fails, but the problem is, I believe, with sharedInstance
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM mol", withArgumentsIn: nil)
        let marrStudentInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                let moleculeInfo : MoleculeInfo = MoleculeInfo()
                moleculeInfo.cid = Int(resultSet.int(forColumn: "mid")) // referencing the column names within the database
                //moleculeInfo.name = resultSet.string(forColumn: "molName") // these are NULL in the database; need to have an exception for when they are NULL
                moleculeInfo.IUPAC = resultSet.string(forColumn: "IUPAC")
                marrStudentInfo.add(moleculeInfo)
                // print("Here is the info",  moleculeInfo.name, ", ", moleculeInfo.cid, ", ", moleculeInfo.IUPAC, "\n")
            }
        }
        
        sharedInstance.database!.close()
        return marrStudentInfo
    }
    
}
