//
//  ScreenManager.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import Foundation
import UIKit

let Screens = ScreensManager.shared

class ScreensManager: NSObject, UIViewControllerTransitioningDelegate {
    static let shared = ScreensManager()
    
    var baseViewController:UIViewController?
    
    
    
    
    fileprivate func showViewController(_ viewController : UIViewController, on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        if modal {
            if let parentVC = parent {
                parentVC.present(viewController, animated: animated)
            } else {
                baseViewController?.present(viewController, animated: animated)
            }
        } else {
            if let nav = parent as? UINavigationController {
                nav.pushViewController(viewController, animated: animated)
            } else {
                print("Did not pass in a navigation controller to push on")
            }
        }
    }
    
    
    
    func Home( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func OTPScreen(userData:registreduser, on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "OTPViewController") as? OTPViewController {
            vc.userDetails = userData
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func registerScceren( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "RegisterPageViewController") as? RegisterPageViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func Dashboard( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func ProfileView( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func BikeView( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "BikeDetailsViewController") as? BikeDetailsViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    func CreateRideView( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "rides", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "CreateRideViewController") as? CreateRideViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func locationPicker( on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Alert", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "locationPickerViewController") as? locationPickerViewController {
            
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func MessageScreen(groupData: GroupsModel, on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Group", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "GroupsViewController") as? GroupsViewController {
            vc.groupModel = groupData
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    func GroupDetailsScreen(groupData: GroupsModel, on parent : UIViewController? = nil, modal: Bool = false, animated : Bool = true) {
        let storyBoard = UIStoryboard(name: "Group", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "GroupDetailsViewController") as? GroupDetailsViewController {
            vc.groupModel = groupData
            showViewController(vc, on: parent, modal: modal, animated: animated)
        }
    }
    
    
}
