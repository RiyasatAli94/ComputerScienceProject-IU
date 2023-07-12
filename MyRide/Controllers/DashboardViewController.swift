//
//  DashboardViewController.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import UIKit
import Foundation
//import SwiftyJSON

class DashboardViewController: UIViewController {

    @IBOutlet weak var topbarHeightCons: NSLayoutConstraint!
    @IBOutlet weak var bellIcon : UIButton!
    @IBOutlet weak var DashbaordTableView : UITableView!
    let List = ["Account":["Profile","Create Ride","Groups"],
                "Ride":["Upcoming Rides","Completed Rides"]
    ]
    
    var isRideTrue = Int()
    var isRideFalse = Int()
    
    var GroupData: [GroupsModel]?
    var RideModelData: [RideModels]?
    var NonComRideModelData = [RideModels]()
    var ComplateRideModelData = [RideModels]()
    let rideDataTB = RideCoreData.sharedInstance.fetchObservation()
    override func viewDidLoad() {
        super.viewDidLoad()
        SetData()
        getGroups()
        systemConfiguration()
        tbViewFunc()
        DashbaordTableView.delegate = self
        DashbaordTableView.dataSource = self
    }
    
    func SetData(){
//        do {
//            if let unwrappedURL = Bundle.main.url(forResource: "SuitesAndSystem", withExtension: "json") {
//                let data = try Data(contentsOf: unwrappedURL)
//                let res = try JSONDecoder().decode([GroupsModel].self, from: data)
//                GroupData = res
//            } else {
//                showToast("Unable to load mySetu Suites")
//            }
//        }
//        catch {
//            print(error)
//            showToast(error.localizedDescription)
//        }
        
        
        do {
            if let unwrappedURL = Bundle.main.url(forResource: "UpcomingRide", withExtension: "json") {
                let data = try Data(contentsOf: unwrappedURL)
                let res = try JSONDecoder().decode([RideModels].self, from: data)
                RideModelData = res
                if let RideData = RideModelData{
                    for ride in RideData{
                        if ride.isRideCompleted == true{
                            isRideTrue = isRideTrue + 1
                            NonComRideModelData.append(ride)
                        }else{
                            isRideFalse =  isRideFalse + 1
                            ComplateRideModelData.append(ride)
                        }
                    }
                }
            } else {
                showToast("Unable to load mySetu Suites")
            }
        }
        catch {
            print(error)
            showToast(error.localizedDescription)
        }
        
    }
    
    func getGroups(){
        //startloader()
        let url1 = GroupsURL
        APIManager.sharedInstance.requestGET(url1, success: { (response) in
            
            do {
                let throwables = try JSONDecoder().decode([GroupsModel].self, from: response.rawData())
                print(throwables)
                //self.endloader()
                self.GroupData = throwables
                self.DashbaordTableView.reloadData()
            } catch let jsonErr {
                print(jsonErr)
                self.presentAlert("JSON Error Occured", jsonErr.localizedDescription)
            }
            
        }) { (err) in
            self.presentAlert("Error Occurred", err.localizedDescription)
        }
    }
    
        
    
    
    @IBAction func NextBtn(_ sender: Any) {
        let alert = CommonAlertServices.shared.sideMenuButton()
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    @IBAction func NotificationBtn(_ sender: Any) {
        
        return
        
        //bellIcon.setImage(UIImage(named: "BellEm"), for: .normal)
    }
}

extension DashboardViewController{
    func systemConfiguration(){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")
                topbarHeightCons.constant = 60
            case 1334:
                print("iPhone 6/6S/7/8")
                topbarHeightCons.constant = 80
            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")
                topbarHeightCons.constant = 80
            default:
                print("Unknown")
                topbarHeightCons.constant = 100
            }
        }
    }
}
