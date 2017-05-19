import UIKit

class ShadowButton: UIButton {
    override func awakeFromNib() {
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
        
        //Rounded
        layer.cornerRadius = 2.5
    }
}

class CameraButton: UIButton {
    override func awakeFromNib() {
        //alpha = 0.0
        //isEnabled = false
        
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        layer.masksToBounds = false
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
        
        //Rounded
        layer.cornerRadius = 2.5
    }
}

class RoundButton: UIButton {
    var isPressed = false
    
    override func awakeFromNib() {
        //Make circular
        layer.cornerRadius = 0.5 * bounds.size.width
        
        //scale image size
        imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Give Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.3
    }
}
