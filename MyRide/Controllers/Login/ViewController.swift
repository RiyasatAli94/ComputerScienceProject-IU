//
//  ViewController.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        let isLogin = UserDefaults.standard.bool(forKey: isUserLogin)
        if Auth.auth().currentUser != nil{
            ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
        }else{
            ScreensManager.shared.Home(on: self, modal: true, animated: false)
        }
    }
    
    @objc func userActive(Noti : Notification) {
        
    }
    
    @objc func userDeActive(Noti : Notification) {
        
    }
}

