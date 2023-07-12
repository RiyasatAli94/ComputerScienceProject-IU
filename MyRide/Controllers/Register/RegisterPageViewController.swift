//
//  RegisterPageViewController.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import UIKit
import CountryPickerView
import FirebaseDatabase
import Alamofire

class RegisterPageViewController: UIViewController {
    
    private let database = Database.database().reference()
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var MobileTxt: UITextField!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var countryBtn: UIButton!
    var countryCode = "+91"
    var countryName = "India"
    var cpv = CountryPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        hideKeyboardWhenTappedAround()
        NotificationObserver()
        PlaceHolderColor()
        MobileTxt.delegate = self
        cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + 20.0))
        cpv.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(alertdismis), name: Notification.Name(AlertDimiss), object: nil)
    }
    
    @objc func alertdismis(noty : Notification){
        ScreensManager.shared.Home(on: self, modal: true, animated: false)
    }
    
    func setupDesign(){
        nextBtn.layer.cornerRadius = 10
    }
    
    @IBAction func countryCode(_ sender: Any) {
        cpv.showCountriesList(from: self)
        
    }

    @IBAction func loginBtn(_ sender: Any) {
        let para : Parameters = [
              "id": 0,
              "name": Utils.unWrapString(string: MobileTxt.text),
              "mobileNo": Utils.unWrapString(string: nametxt.text),
              "email": Utils.unWrapString(string: emailtxt.text),
              "password": Utils.unWrapString(string: passwordtxt.text)
            
        ]
        startloader()
        register(para)
        
    }

    @IBAction func backBtn(_ sender: Any) {
        ScreensManager.shared.Home(on: self, modal: true, animated: false)
    }

}

extension RegisterPageViewController{
    func register(_ request: Parameters) {
        let url = registerPost
        APIManager.sharedInstance.requestPOST(url, params: request, success: { (response) in
            self.endloader()
            self.showPop(text: "You are sucessfully register with MyRide!")
        }) { (err) in
            self.showPop(text: "Error Occur")
        }
    }
}

extension RegisterPageViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 17
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //MobileTxt.text = countryCode
    }
}


extension RegisterPageViewController: CountryPickerViewDelegate{
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print(country)
        countryCode = country.phoneCode
        countryName = country.name
        //MobileTxt.text = countryCode
        countryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        countryBtn.setTitle("\(countryCode)", for: .normal)
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, willShow viewController: CountryPickerViewController) {
        print("")
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didShow viewController: CountryPickerViewController) {
        print("")
    }
    
}
