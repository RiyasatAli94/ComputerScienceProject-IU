//
//  SideMenu+TableView.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import Foundation
import UIKit
import FirebaseAuth
extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tbViewFunc(){
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.backgroundColor = .white
        tbView.delegate = self
        tbView.dataSource = self
        tbView.separatorStyle = .none
        tbView.alwaysBounceVertical = false
        tbView.showsVerticalScrollIndicator = true
        tbView.register(SideMenuView.self, forCellReuseIdentifier: "Cell1")
        tbView.register(SideMenuViewHeader.self, forHeaderFooterViewReuseIdentifier: "Header1")
        //
        tbView.estimatedRowHeight = 44.0
        tbView.rowHeight = UITableView.automaticDimension
        tbView.sectionHeaderHeight = UITableView.automaticDimension
        tbView.estimatedSectionHeaderHeight = 98.0
        tbView.sectionFooterHeight = 0.0
        tbView.estimatedSectionFooterHeight = 0.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return List.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            let count = List["Account"]!.count
            print("Count Account :- \(count)")
            return count
        }else{
            let count = List["Ride"]!.count
            print("Count Ride :- \(count)")
            return count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! SideMenuView
        if indexPath.section == 0{
            cell.titleLbl.text = List["Account"]![indexPath.row]
        }else{
            cell.titleLbl.text = List["Ride"]![indexPath.row]
            cell.titleLbl.attributedText = getCustomAttributedText(15, List["Ride"]![indexPath.row], "(Comming Soon)")
        }
        return cell
    }
    
    //
    // MARK:- header
    //
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header1") as! SideMenuViewHeader
        if section == 0{
            header.titleLbl.text = "Account"
        }else{
            header.titleLbl.text = "Rides"
        }
        //
        return header
    }
    
    //
    // MARK:- footer
    //
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 3{
                do{
                    try Auth.auth().signOut()
                    ScreensManager.shared.Home(on: self, modal: true, animated: false)
                }catch{
                    let alert = CommonAlertServices.shared.alertPresent(Text: "Sign-Out Failed, Please try ones more")
                    self.present(alert, animated: false, completion: nil)
                }
            }else if indexPath.row == 0{
                ScreensManager.shared.ProfileView(on: self,modal: true, animated: false)
            }else if indexPath.row == 1{
                ScreensManager.shared.CreateRideView(on: self,modal: true, animated: false)
            }else if indexPath.row == 2{
                ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
            }
        }
    }
}
