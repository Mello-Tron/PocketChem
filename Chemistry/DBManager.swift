//
//  DBManager.swift
//  Chemistry
//
//  Created by Kaitlyn J Shaw on 4/27/17.
//  Copyright © 2017 bleh. All rights reserved.
//

// Here is the tutorial that I referenced for most of the coding I've done: http://www.theappguruz.com/blog/use-sqlite-database-swift

import UIKit
import Foundation

let sharedInstance = DBManager()

class DBManager: NSObject {
    
    //var database: FMDatabase? = nil // the first way of declaring the database. I think the nil is the problem, but if we take that off, it has the same error.
   // /*
     static let shared: DBManager = DBManager() // the second way. both have the same error
     private let dbFileName = "mol.db"
     //private var database:FMDatabase!
    var database = FMDatabase(path: "path")
    // */
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
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM student_info", withArgumentsIn: nil)
        let marrStudentInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                let moleculeInfo : MoleculeInfo = MoleculeInfo()
                moleculeInfo.cid = Int(resultSet.int(forColumn: "cid")) // referencing the column names within the database
                moleculeInfo.name = resultSet.string(forColumn: "name")
                moleculeInfo.IUPAC = resultSet.string(forColumn: "IUPAC")
                marrStudentInfo.add(moleculeInfo)
            }
        }
        
        print(marrStudentInfo) // for testing
        
        sharedInstance.database!.close()
        return marrStudentInfo
    }
    
    
    /*
     func openDatabase() -> Bool
     {
     if database == nil{
     
     }
     }
     
     
     
     override init()
     {
     openDatabase()
     }
     
     
     */
}
