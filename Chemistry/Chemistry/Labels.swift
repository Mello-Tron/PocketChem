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
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        
        //text update --> DATABASE
        
        let setInfo : Int = DBManager().getSetSize(setNum: 1)
        
        // convert to string
        let xNSNumber = setInfo as NSNumber
        let xString : String = xNSNumber.stringValue
        
        text = xString
        
    }
}
