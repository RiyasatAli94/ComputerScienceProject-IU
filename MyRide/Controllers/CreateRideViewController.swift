//
//  CreateRideViewController.swift
//  MyRide
//
//  Created by Keval Shah on 01/04/23.
//

import UIKit
import Alamofire

class CreateRideViewController: UIViewController {
    
    @IBOutlet weak var riderName: UITextField!
    
    @IBOutlet weak var startDateTxt: UIButton!
    
    @IBOutlet weak var endDateTxt: UIButton!
    
    @IBOutlet weak var WeekTxt: UIButton!
    
    @IBOutlet weak var startRideLocationTxt: UITextField!
    
    @IBOutlet weak var endRideLocation: UITextField!
    
    @IBOutlet weak var MeetTimeTxt: UIButton!
    
    @IBOutlet weak var briefingTimeTxt: UIButton!
    
    @IBOutlet weak var FlagOffTimeTxt: UIButton!
    
    @IBOutlet weak var CostTxt: UITextView!
    
    @IBOutlet weak var MealPlanTxt: UITextView!
    var number = 0
    var startDate = String()
    var endDate = String()
    var meetTime = String()
    var briefingTime = String()
    var flagTime = String()
    var weekName = String()
    var saveRideData : rideModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print(1)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(RideSave), name: Notification.Name("RideSaved"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func RideSave(noty : Notification){
        let alert = UIAlertController(title: "Alert", message: "Ride Saved!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    @IBAction func backBtn(_ sender: Any) {
        ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if riderName.text == "" || riderName.text == " "{
            showToast("Ride Name Emply")
            return
        }
        
        if CostTxt.text == "" || CostTxt.text == "Cost"{
            showToast("Enter Ride Cost/Package")
            return
        }
        
        if MealPlanTxt.text == "" || MealPlanTxt.text == "Meal"{
            showToast("Enter Meal Plan")
            return
        }
        
        if startRideLocationTxt.text == "" || startRideLocationTxt.text == " "{
            showToast("Enter Start Location")
            return
        }
        
        if endRideLocation.text == "" || endRideLocation.text == " "{
            showToast("Enter End Location")
            return
        }
        
        if startDate == "" {
            showToast("Enter Start Date")
            return
        }
        
        if endDate == "" {
            showToast("Enter End Date")
            return
        }
        
        if meetTime == "" {
            showToast("Enter Meeting Time")
            return
        }
        
        if briefingTime == "" {
            showToast("Enter Briefing Time")
            return
        }
        
        if flagTime == "" {
            showToast("Enter Flag off Time")
            return
        }
        
        
        
        var ride : [String : String] = [
            NDrideNam : Utils.unWrapString(string: riderName.text),
            NDstartDate : startDate,
            NDendDate : endDate,
            NDweekName : weekName,
            NDstartlocation : Utils.unWrapString(string:startRideLocationTxt.text),
            NDendLocation : Utils.unWrapString(string:endRideLocation.text),
            NDMeetingTime : meetTime,
            NDBriefingTime : briefingTime,
            NDFlgTine : flagTime,
            NDCost : Utils.unWrapString(string:CostTxt.text),
            NDMeal : Utils.unWrapString(string:MealPlanTxt.text)
        ]
        do{
            try RideCoreData.sharedInstance.Save(rideDetails: ride)
        }catch{
            print("")
        }
        
    }
    
    @IBAction func startRideBtn(_ sender: Any) {
        number = 1
        let alert = CommonAlertServices.shared.DatePicker(isDate: true)
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    @IBAction func endRideBtn(_ sender: Any) {
        number = 2
        let alert = CommonAlertServices.shared.DatePicker(isDate: true)
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    @IBAction func startLocationBtn(_ sender: Any) {
        ScreensManager.shared.locationPicker(on: self, modal: true, animated: false)
    }
    
    @IBAction func endlocationBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func weeknameBtn(_ sender: Any) {
        let alert = CommonAlertServices.shared.dayPicker()
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    @IBAction func meetTimeBtn(_ sender: Any) {
        number = 3
        let alert = CommonAlertServices.shared.DatePicker(isDate: false)
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    @IBAction func briefingTimeBtn(_ sender: Any) {
        number = 4
        let alert = CommonAlertServices.shared.DatePicker(isDate: false)
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    @IBAction func flogTimeBtn(_ sender: Any) {
        number = 5
        let alert = CommonAlertServices.shared.DatePicker(isDate: false)
        alert.delegate = self
        self.present(alert, animated: true)
    }
    
    
    
}


extension CreateRideViewController : DayPickerDelegate, DatePickerDelegate{
    func delegete(Date: String, Time: String, isDate: Bool) {
        switch number{
        case 1:
            startDateTxt.setTitle(Date, for: .normal)
            startDate = Date
        case 2:
            endDateTxt.setTitle(Date, for: .normal)
            endDate = Date
        case 3:
            MeetTimeTxt.setTitle(Time, for: .normal)
            meetTime = Time
        case 4:
            briefingTimeTxt.setTitle(Time, for: .normal)
            briefingTime = Time
        case 5:
            FlagOffTimeTxt.setTitle(Time, for: .normal)
            flagTime = Time
        default:
            print("")
        }
    }
    
    func delegete(Week_Name: String) {
        WeekTxt.setTitle(Week_Name, for: .normal)
        weekName = Week_Name
    }
}
