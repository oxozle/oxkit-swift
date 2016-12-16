//
//  OXNavigationBar.swift
//  OXKit
//
//  Created by Dmitriy on 04.04.16.
//
//

import UIKit


public class OXNavigationBar: UINavigationBar {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        barStyle = UIBarStyle.black
        shadowImage = UIImage()
        isTranslucent = false
        setBackgroundImage(UIImage(), for: .default)
        //barTintColor = appearence.barTintColor
        tintColor = UIColor.white
    }
    func updateStyle() {
//        if lastTint != tint {
//            lastTint = tint
//            switch tint {
//            case .White:
//                self.tintColor = UIColor.whiteColor()
//            default:
//                break;
//            }
//        }
//        if lastTransparency != transparency {
//            lastTransparency = transparency
//            switch transparency {
//            case .Transparent:
//                gradientLayer.colors = [UIColor.clearColor().CGColor, UIColor.clearColor().CGColor]
//                _fancyLayer?.removeFromSuperlayer()
//                //            case .Invisible:
//                //                gradientLayer.colors = [UIColor.clearColor().CGColor, UIColor.clearColor().CGColor]
//            //                _fancyLayer?.removeFromSuperlayer()
//            case .Gradient:
//                //                gradientLayer.colors = [UIColor(rgba: "#682839").CGColor, UIColor(rgba:"#592737").CGColor]
//                gradientLayer.colors = Style.Navigation.ColorGradientCGColors //[UIColor(rgba: "#c33541").CGColor, UIColor(rgba:"#ca1245").CGColor]
//                //                rightLayer.colors = [UIColor(rgba: "#94273f").CGColor, UIColor(rgba: "#7e283c").CGColor]
//                //                leftLayer.colors = [UIColor(rgba: "#355d8f").CGColor, UIColor(rgba: "#33517b").CGColor]
//                
//                //                layer.masksToBounds = false
//                //                layer.shadowColor = UIColor(rgba: "#431D29").CGColor
//                //                layer.shadowOpacity = 0.0
//                //                layer.shadowOffset = CGSizeMake(0,5)
//                //                layer.shadowRadius = 3
//                //                layer.shouldRasterize = true
//                _fancyLayer?.removeFromSuperlayer()
//            case .Opaque:
//                break
//            //                gradientLayer.colors = [UIColor(rgba: "#2D2632").CGColor, UIColor(rgba:"#aa2e38").CGColor]
//            default:
//                break;
//            }
//        }
    }
    
    
    override open func layoutSubviews() {
        updateStyle()
        super.layoutSubviews()
    }
}
