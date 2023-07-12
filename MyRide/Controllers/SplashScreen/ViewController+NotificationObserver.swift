//
//  ViewController+NotificationObserver.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import Foundation
import UIKit
extension SplashViewController{
    func NotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
