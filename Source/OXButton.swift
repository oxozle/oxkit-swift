//
//  OXButton.swift
//  Pods
//
//  Created by Dmitriy Azarov on 16/04/16.
//
//

import UIKit

@IBDesignable
open class OXButton: UIButton {
    
    //MARK: - IB Inspectable
    @IBInspectable
    open var cornerRadius: CGFloat  = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
            if(self.layer.cornerRadius > 0){
                self.layer.masksToBounds = true
            }
            
        }
    }
    
    @IBInspectable
    open var borderColor: UIColor? = nil{
        didSet{
            if borderColor != nil {
                self.layer.borderColor = borderColor!.cgColor
            }
        }
    }
    
    @IBInspectable
    open var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

}
