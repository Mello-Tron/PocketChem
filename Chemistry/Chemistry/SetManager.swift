import UIKit

//Manages Set Information Inside a View Controller
class SetManager {
    private var set: NSMutableArray
    private var setID: Int
    private var setSize: Int
    private var currentMolecule: MoleculeInfo
    private var currentMoleculeID: Int
    //private var setName: String
    
    init(_setID: Int) {
        setID = _setID
        
        setSize = DBManager().getSetSize(setNum: setID)
        currentMoleculeID = 0
        
        set = DBManager().getASet(num: setID)
        currentMolecule = set[currentMoleculeID] as! MoleculeInfo
        
        //setName = DBManager().getSetName(setNum: setID)
    }
    
    func changeSet(_setID: Int) {
        setID = _setID
        
        setSize = DBManager().getSetSize(setNum: setID)
        currentMoleculeID = 0
        
        set = DBManager().getASet(num: setID)
        currentMolecule = set[currentMoleculeID] as! MoleculeInfo
        
        //setName = DBManager().getSetName(setNum: setID)
    }
    
    func changeMolecule(_shift: Int) -> Bool {
        let newMoleculeID = currentMoleculeID + _shift
        
        if (newMoleculeID >= 0 && newMoleculeID < setSize) {
            currentMoleculeID = newMoleculeID
            currentMolecule = set[currentMoleculeID] as! MoleculeInfo
            return true
        }
        
        return false
    }
    
    func getCurrentMoleculeID() -> Int {
        return currentMoleculeID
    }
    
    //func getSetName() -> String {
        //return setName
    //}
    
    // Katie added this
    func getMoleculeImageNum() -> Int{
        return currentMolecule.cid
    }
    
    func getCurrentMoleculeName() -> String {
        return currentMolecule.IUPAC
    }
    
    func getSetSize() -> Int {
        return setSize
    }
}
