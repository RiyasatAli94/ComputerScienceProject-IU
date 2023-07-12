//
//  extntion.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import Foundation
import UIKit


extension UIView{
    func cardView() -> Void {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func startloader(){
        let alert = CommonAlertServices.shared.StartLoader()
        present(alert, animated: false, completion: nil)
    }
    
    func endloader(){
        dismiss(animated: false, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showPop(text : String){
        let alert = CommonAlertServices.shared.alertPresent(Text: text)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
    func UserId() -> String{
        return Utils.unWrapString(string: UserDefaults.standard.string(forKey: User_Id))
    }
    
    func UserName() -> String{
        return Utils.unWrapString(string: UserDefaults.standard.string(forKey: User_Name))
    }
    
    func UserEmail() -> String{
        return Utils.unWrapString(string: UserDefaults.standard.string(forKey: User_Email))
    }
    
    func UserMobile() -> String{
        return Utils.unWrapString(string: UserDefaults.standard.string(forKey: User_Mobile_Number))
    }
}
