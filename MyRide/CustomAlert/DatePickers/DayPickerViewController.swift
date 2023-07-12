//
//  DayPickerViewController.swift
//  MyRide
//
//  Created by Keval Shah on 06/07/23.
//

import UIKit

protocol DayPickerDelegate{
    func delegete(Week_Name : String)
}

class DayPickerViewController: UIViewController {

    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var thusday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var saturday: UIButton!
    @IBOutlet weak var sunday: UIButton!
    var delegate : DayPickerDelegate! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        colorDesign()
       
    }
    
    @IBAction func mondaybtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Monday")
        dismiss(animated: true)
        
    }
    
    @IBAction func tuesdaybtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Tuesday")
        dismiss(animated: true)
    }
    
    @IBAction func wednesdaybtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Wednesday")
        dismiss(animated: true)
    }
    
    @IBAction func thusdaybtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Thusday")
        dismiss(animated: true)
    }
    
    @IBAction func fridaybtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Friday")
        dismiss(animated: true)
    }
    
    @IBAction func satbtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Saturday")
        dismiss(animated: true)
    }
    
    @IBAction func sunbtn(_ sender: Any) {
        delegate.delegete(Week_Name: "Sunday")
        dismiss(animated: true)
    }
    
}

extension DayPickerViewController{
    func colorDesign(){
        if let weekDay = Date().dayOfWeek(){
            switch weekDay{
            case "Monday":
                monday.setTitleColor(.blue, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
                
                
            case "Tuesday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.blue, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
            case "Wednesday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.blue, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
            case "Thusday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.blue, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
            case "Friday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.blue, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
                
            case "Saturday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.blue, for: .normal)
                sunday.setTitleColor(.black, for: .normal)
            case "Sunday":
                monday.setTitleColor(.black, for: .normal)
                tuesday.setTitleColor(.black, for: .normal)
                wednesday.setTitleColor(.black, for: .normal)
                thusday.setTitleColor(.black, for: .normal)
                friday.setTitleColor(.black, for: .normal)
                saturday.setTitleColor(.black, for: .normal)
                sunday.setTitleColor(.blue, for: .normal)
            default:
                print("")
            }
        }
        
        func bottomColor(btn : UIButton){
            var lineView = UIView(frame: CGRectMake(0, 0, btn.frame.size.width, 1))
            lineView.backgroundColor=UIColor.red
            btn.addSubview(lineView)
        }
    }
}


extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}
