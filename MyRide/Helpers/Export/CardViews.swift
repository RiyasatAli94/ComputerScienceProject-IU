//
//  CardViews.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 04/04/22.
//  Copyright © 2022 Irfan Ajmeri. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func cardView1() -> Void {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
    }
}

extension UIView{
    func borderLine() -> Void {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}

extension UIViewController{
    func PresentDateTime(Mode : Bool, Controller : UIViewController){
        
    }
}

extension UIView {
   func viewRoundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
