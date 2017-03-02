//
//  ZDQTextRestrict.swift
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

import UIKit

typealias ZDQtringFilter = (_ aString:String) ->Bool

func kFilterString(handleString:String, subStringFilter:ZDQtringFilter) -> String{
    let modifyString:NSMutableString = handleString.mutableCopy() as! NSMutableString
    var i:Int = 0
    for _ in 0...(modifyString as NSString).length {
        let subString = (modifyString as NSString).substring(with: NSRange.init(location: i, length: 1))
        if subStringFilter(subString as String) {
            i  = i + 1;
        }else{
            modifyString.deleteCharacters(in: NSRange.init(location: i, length: 1))
        }
    }
    return modifyString as String
}

func kMatchStringFormat(handleString:NSString, matchFormat:NSString) -> Bool{
    let predicate = NSPredicate.init(format: "SELF MARCHES %@", matchFormat)
    return predicate.evaluate(with: handleString)
}

enum ZDQRestrictType {
    case OnlyNumber
    case OnlyDecimal
    case OnlyCharcter
}

class ZDQNumberTextRestrict: ZDQTextRestrict {
    
    override func textDidChange(textField: UITextField) {
        textField.text = kFilterString(handleString: textField.text!, subStringFilter: { (aString) -> Bool in
            return kMatchStringFormat(handleString: aString as NSString, matchFormat: "^\\d$")
        })
    }
    
}

class ZDQDecimalTextRestrict: ZDQTextRestrict {
    
    override func textDidChange(textField: UITextField) {
        textField.text = kFilterString(handleString: textField.text!, subStringFilter: { (aString) -> Bool in
            return kMatchStringFormat(handleString: aString as NSString, matchFormat: "^[0-9.]$")
        })
    }
}

class ZDQCharacterTextRestrict: ZDQTextRestrict {
    
    override func textDidChange(textField: UITextField) {
        textField.text = kFilterString(handleString: textField.text!, subStringFilter: { (aString) -> Bool in
            return kMatchStringFormat(handleString: aString as NSString, matchFormat: "^[^[\\u4e00-\\u9fa5]]$")
        })
    }
}

class ZDQTextRestrict: NSObject {
    
    var maxLength:NSInteger!
    var restrictType:ZDQRestrictType!
    
    class func textRestrictWithRestricType(restricType:ZDQRestrictType) -> ZDQTextRestrict {
        var textRestric:ZDQTextRestrict!
        switch restricType {
        case .OnlyNumber:
            textRestric = ZDQNumberTextRestrict()
        case .OnlyDecimal:
            textRestric = ZDQDecimalTextRestrict()
        default:
            textRestric = ZDQCharacterTextRestrict()
        }
        textRestric.restrictType = restricType
        return textRestric
        
    }
    
    func textDidChange(textField:UITextField) {
        
    }

}

extension UITextField {
    
//    var textRestrict:ZDQTextRestrict {
//        get {
////            if objc_getAssociatedObject(self, "ZDQTextRestrict") != nil {
////                print(objc_getAssociatedObject(self, "ZDQTextRestrict"))
////                return objc_getAssociatedObject(self, "ZDQTextRestrict") as! ZDQTextRestrict
////            }else{
//                let restrict = ZDQTextRestrict.init()
//                return restrict
////            }
//        }set {
//            textRestrict.maxLength = self.maxTextLength
//            self.addTarget(textRestrict, action: #selector(ZDQTextRestrict.textDidChange(textField:)), for: UIControlEvents.editingChanged)
//            objc_setAssociatedObject(self, "textRestrict", textRestrict, objc_AssociationPolicy.init(rawValue: 1)!)
//            
//        }
//    }
//    
//    var restrictType:ZDQRestrictType {
//        get{
//            if objc_getAssociatedObject(self, "ZDQRestrictType") != nil {
//                return objc_getAssociatedObject(self, "ZDQRestrictType") as! ZDQRestrictType
//            }
//            return .OnlyNumber
//        }set{
//            objc_setAssociatedObject(self, "ZDQRestrictType", restrictType, objc_AssociationPolicy.init(rawValue: 1)!)
//            self.textRestrict = ZDQTextRestrict.textRestrictWithRestricType(restricType: restrictType)
//        }
//    }
//    
//    var maxTextLength:NSInteger {
//        get {
//            if objc_getAssociatedObject(self, "maxTextLength") != nil {
//                return objc_getAssociatedObject(self, "maxTextLength") as! NSInteger
//            }else{
//                return 0
//            }
//        }set {
//            objc_setAssociatedObject(self, "maxTextLength", maxTextLength, objc_AssociationPolicy.init(rawValue: 1)!)
//        }
//    }
//    
//    
//    
//    func setTextRestrict(textRestrict:ZDQTextRestrict) {
//        
//    }
}
