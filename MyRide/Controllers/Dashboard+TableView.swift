//
//  Dashboard+TableView.swift
//  MyRide
//
//  Created by Keval Shah on 21/02/23.
//

import Foundation
import UIKit
//import SwiftyJSON
extension DashboardViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tbViewFunc(){
        DashbaordTableView.translatesAutoresizingMaskIntoConstraints = false
        DashbaordTableView.backgroundColor = .white
        DashbaordTableView.delegate = self
        DashbaordTableView.dataSource = self
        DashbaordTableView.separatorStyle = .none
        DashbaordTableView.alwaysBounceVertical = false
        DashbaordTableView.showsVerticalScrollIndicator = true
        DashbaordTableView.register(SideMenuView.self, forCellReuseIdentifier: "Cell1")
        DashbaordTableView.register(GroupsCell.self, forCellReuseIdentifier: "GourpCell")
        DashbaordTableView.register(RideCell.self, forCellReuseIdentifier: "RideCell")
        DashbaordTableView.register(SideMenuViewHeader.self, forHeaderFooterViewReuseIdentifier: "Header1")
        //
        DashbaordTableView.estimatedRowHeight = 44.0
        DashbaordTableView.rowHeight = UITableView.automaticDimension
        DashbaordTableView.sectionHeaderHeight = UITableView.automaticDimension
        DashbaordTableView.estimatedSectionHeaderHeight = 98.0
        DashbaordTableView.sectionFooterHeight = 0.0
        DashbaordTableView.estimatedSectionFooterHeight = 0.0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if let data = GroupData?[indexPath.row]{
                ScreensManager.shared.MessageScreen(groupData: data,on: self, modal: true,animated: false)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            if let count = GroupData?.count{
                return count
            }
        }else if section == 1{
            return rideDataTB.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = DashbaordTableView.dequeueReusableCell(withIdentifier: "RideCell", for: indexPath) as! RideCell
        if indexPath.section == 0{
            let Gcell = DashbaordTableView.dequeueReusableCell(withIdentifier: "GourpCell", for: indexPath) as! GroupsCell
            Gcell.setterObj = GroupData?[indexPath.row]
            return Gcell
        }
       
        if indexPath.section == 1{
           cell.setterObj = rideDataTB[indexPath.row]
            
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
            header.titleLbl.text = "Communities & Groups"
            header.titleLbl.backgroundColor = .headerbarcolor
        }else if section == 1{
            header.titleLbl.text = "Rides"
            header.titleLbl.backgroundColor = .headerbarcolor
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
}
