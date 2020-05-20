//
//  extentions.swift
//  PetKeeper
//
//

import Foundation
import UIKit

extension UIViewController{
    func bindKeyborad()->Void{
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(norification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(norification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(norification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func unbindKeyboard(){
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification, object: nil)
         NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @objc func keyboardWillChange(norification: Notification)->Void{
        switch norification.name.rawValue{
        case UIResponder.keyboardWillChangeFrameNotification.rawValue:
            fallthrough
        case UIResponder.keyboardWillShowNotification.rawValue:
            let keyboardFrame = (norification.userInfo! [UIResponder.keyboardFrameEndUserInfoKey] as!NSValue).cgRectValue
            
            view.frame.origin.y = -keyboardFrame.height
            break
        case UIResponder.keyboardWillHideNotification.rawValue:
            view.frame.origin.y = 0
            break
        default:
            return
        }
    }
    
    
}
