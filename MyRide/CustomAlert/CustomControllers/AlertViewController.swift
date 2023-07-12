//
//  AlertViewController.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var view1 : UIView!
    @IBOutlet weak var upView : UIView!
    var text = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.cardView()
        upView.layer.cornerRadius = 10
        titleLbl.text = text
    }
    
    @IBAction func ok(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: AlertDimiss), object: nil, userInfo: nil)
        self.dismiss(animated: false)
    }


}
