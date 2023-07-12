//
//  Register+NotificationObserver.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import Foundation
import UIKit
extension RegisterPageViewController{
    func NotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

extension RegisterPageViewController{
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 90
                
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func PlaceHolderColor(){
        MobileTxt.attributedPlaceholder = NSAttributedString(
            string: "Enter Mobile Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        nametxt.attributedPlaceholder = NSAttributedString(
            string: "Enter Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        emailtxt.attributedPlaceholder = NSAttributedString(
            string: "Enter Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        
        passwordtxt.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
    }
}
