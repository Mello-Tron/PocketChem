import UIKit

class ShadowLabel: UILabel {
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        
    }
}
class textUpdate: UILabel {
    var currentSet = 0
    var setSize = 0
    var currentMoleculeNumber = 0
    
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        
        //HARD CODED SETUP FOR ALKANES
        currentSet = 1
        setSize = DBManager().getSetSize(setNum: currentSet)
        currentMoleculeNumber = 0
        updateText()
    }
    
    func setSetSize(size: Int) {
        setSize = size
    }
    
    func updateMoleculeNumber(newMoleculeNumber: Int) {
        currentMoleculeNumber = newMoleculeNumber
        updateText()
    }
    
    func updateText() {
        text = String(currentMoleculeNumber + 1) + "/" + String(setSize)
    }
}
