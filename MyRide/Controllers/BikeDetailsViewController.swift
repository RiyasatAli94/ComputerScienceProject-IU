//
//  BikeDetailsViewController.swift
//  MyRide
//
//  Created by Keval Shah on 27/03/23.
//

import UIKit

class BikeDetailsViewController: UIViewController {
    
    @IBOutlet weak var TitleView_view: UIView!
    
    @IBOutlet weak var TitleLbl: UILabel!
    
    @IBOutlet weak var titleBack_btn: UIButton!
    
    @IBOutlet weak var Brand_txt: UITextField!
    
    @IBOutlet weak var Bike_txt: UITextField!
    
    @IBOutlet weak var bikeName_txt: UITextField!
    
    @IBOutlet weak var RegisterNumber_txt: UITextField!
    
    @IBOutlet weak var Country_txt: UITextField!
    
    @IBOutlet weak var KM_txt: UITextField!
    
    @IBOutlet weak var year_txt: UITextField!
    
    @IBOutlet weak var color_txt: UITextField!
    
    @IBOutlet weak var cc_txt: UITextField!
    
    @IBOutlet weak var save_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandTxtDesign()
    }
    
    @IBAction func save_btn_action(_ sender: Any) {
        if Brand_txt.text == "" || Bike_txt.text == "" || RegisterNumber_txt.text == "" || Country_txt.text == "" || KM_txt.text == "" || year_txt.text == "" || color_txt.text == "" || cc_txt.text == "" || bikeName_txt.text == "" {
            showPop(text: "Please Enter All Details.")
        }else{
            postBikeDetails()
        }
    }

    @IBAction func back_btn_action(_ sender: Any) {
        self.dismiss(animated: false)
    }
    

}

