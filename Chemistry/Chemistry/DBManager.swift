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

    var databasePath: String = ""
    
    static let shared: DBManager = DBManager() // the second way. both have the same error
    private let dbFileName = "mol.db"
    //private var database:FMDatabase!
    //var database = FMDatabase(path: "/Users/kduarte17/ChemStudyApp/Chemistry/Chemistry/database/mol.db") // HARD CODED PATH
    var database = FMDatabase(path: "/Users/kshaw17/Documents/ChemStudyApp/Chemistry/Chemistry/databaseInProject/mol.db") // HARD CODED PATH
    
    func createOrReturnDatabase() -> FMDatabase {
        
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docsDir = dirPaths[0]
        
        let pathForDB = Bundle.main.resourcePath! + "/mol.db"
        
        databasePath = docsDir + "/mol.db"
        
        if !fileManager.fileExists(atPath: databasePath as String) {
            print("Database not present, so we created one from \(pathForDB)")
            do {
                try fileManager.copyItem(atPath: pathForDB, toPath: databasePath as String)
            } catch {
                
            }
            print("Copied database to \(databasePath), and a file exists there is: \(fileManager.fileExists(atPath: databasePath as String))")
            return FMDatabase(path: databasePath as String)
        } else {
            print("I returned the database because it exists.")
            return FMDatabase(path: databasePath as String)
        }
        
    }
    
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
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM mol", withArgumentsIn: nil)
        let moleculeInfoArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                let moleculeInfo : MoleculeInfo = MoleculeInfo()
                moleculeInfo.cid = Int(resultSet.int(forColumn: "mid")) // referencing the column names within the database
                //moleculeInfo.name = resultSet.string(forColumn: "molName") // these are NULL in the database; need to have an exception for when they are NULL
                moleculeInfo.IUPAC = resultSet.string(forColumn: "IUPAC")
                moleculeInfoArray.add(moleculeInfo)
                // print("Here is the info",  moleculeInfo.name, ", ", moleculeInfo.cid, ", ", moleculeInfo.IUPAC, "\n")
            }
        }
        
        sharedInstance.database!.close()
        return moleculeInfoArray
    }

    
    func getASet(num: Int) -> NSMutableArray // Returns a set specified by the parameter, an int that should specify the index of theset from darthMol
    {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT darthMol.sid, mol.mid, mol.IUPAC FROM mol INNER JOIN darthMol ON mol.mid = darthMol.mid WHERE darthMol.sid = '\(num)'", withArgumentsIn: nil)
        print ("NUM: ", num)
        let setInfoArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                let moleculeInfo : MoleculeInfo = MoleculeInfo()
                moleculeInfo.cid = Int(resultSet.int(forColumn: "mid")) // referencing the column names within the database
                //moleculeInfo.name = resultSet.string(forColumn: "molName") // these are NULL in the database; need to have an exception for when they are NULL
                moleculeInfo.IUPAC = resultSet.string(forColumn: "IUPAC")
                setInfoArray.add(moleculeInfo)
                // print("Here is the info",  moleculeInfo.name, ", ", moleculeInfo.cid, ", ", moleculeInfo.IUPAC, "\n")
            }
        }
        
        sharedInstance.database!.close()
        return setInfoArray
    }
    
    func getSetSize(setNum: Int) -> Int // THERE IS DEFINITELY A BETTER WAY TO DO THIS // KATIE COME BACK AND FIX
    {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT darthMol.sid, mol.mid, mol.IUPAC FROM mol INNER JOIN darthMol ON mol.mid = darthMol.mid WHERE darthMol.sid = '\(setNum)'", withArgumentsIn: nil)
        let setInfoArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            while resultSet.next()
            {
                let moleculeInfo : MoleculeInfo = MoleculeInfo()
                moleculeInfo.cid = Int(resultSet.int(forColumn: "mid")) // referencing the column names within the database
                //moleculeInfo.name = resultSet.string(forColumn: "molName") // these are NULL in the database; need to have an exception for when they are NULL
                moleculeInfo.IUPAC = resultSet.string(forColumn: "IUPAC")
                setInfoArray.add(moleculeInfo)
                // print("Here is the info",  moleculeInfo.name, ", ", moleculeInfo.cid, ", ", moleculeInfo.IUPAC, "\n")
            }
        }
        
        print ("set size is: ", setInfoArray.count)
        
        sharedInstance.database!.close()
        return setInfoArray.count

    }
    
    func getSetName(setNum: Int) -> String // THERE IS DEFINITELY A BETTER WAY TO DO THIS // KATIE COME BACK AND FIX
    {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT setName FROM sets WHERE sid = '\(setNum)'", withArgumentsIn: nil)
        //let setInfoArray : NSMutableArray = NSMutableArray()
        if (resultSet != nil)
        {
            
        }
        
        //print ("set size is: ", setInfoArray.count)
        
        sharedInstance.database!.close()
        return resultSet.string(forColumn: "setName")
        
    }

    
}
