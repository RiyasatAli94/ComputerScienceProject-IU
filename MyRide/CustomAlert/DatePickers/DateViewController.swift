//
//  DateViewController.swift
//  MyRide
//
//  Created by Keval Shah on 05/07/23.
//

import UIKit

protocol DatePickerDelegate{
    func delegete(Date : String, Time : String, isDate : Bool)
}

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var selectDatebtn: UIButton!
    var delegate : DatePickerDelegate! = nil
    
    var isDate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectDatebtn.borderLine()
        if isDate == false{
            datePicker.datePickerMode = .time
            datePicker.preferredDatePickerStyle = .wheels
        }else{
            datePicker.datePickerMode = .date
            datePicker.preferredDatePickerStyle = .inline
        }
            
    
    }
    @IBAction func selectDate(_ sender: Any) {
       
        let date = Utils.expiryDate(date: datePicker.date)
        let time = Utils.selectDate(date: datePicker.date)
        delegate.delegete(Date: date, Time: time, isDate: isDate)
        dismiss(animated: true)
        
    }
    
}
