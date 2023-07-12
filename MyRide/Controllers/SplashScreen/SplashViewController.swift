//
//  SplashViewController.swift
//  MyRide
//
//  Created by Keval Shah on 10/03/23.
//

import UIKit
import CountryPickerView
import FirebaseDatabase

class SplashViewController: UIViewController {

    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var countryBtn: UIButton!
    var countryCode = "+91"

    static let path = Bundle.main.path(forResource: "Config", ofType: "plist")
    static let config = NSDictionary(contentsOfFile: path!)
    private static let baseURLString = config!["serverUrl"] as! String
    var cpv = CountryPickerView()
    private let database = Database.database().reference()
    var userLoginDetails: registreduser?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        hideKeyboardWhenTappedAround()
        PlaceHolderColor()
        NotificationObserver()
        //logoImg.image = UIImage(named: "motorcycle-riding.Png")
        cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + 20.0))
        cpv.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserAlreadyLogin = UserDefaults.standard.bool(forKey: isUserLogin)
        if isUserAlreadyLogin == true{
            //ScreensManager.shared.Dashboard(on: self, modal: true, animated: true)
        }
    }
    
    func setupDesign(){
        mobileTxt.delegate = self
        nextBtn.layer.cornerRadius = 10
    }
    
    @IBAction func countryCode(_ sender: Any) {
        cpv.showCountriesList(from: self)
        
    }
    
    @IBAction func NextBtn(_ sender: Any) {
        if let MobileNumber = mobileTxt.text{
            if MobileNumber.count < 10{
                let alert = CommonAlertServices.shared.alertPresent(Text: "Please Enter Correct Mobile Number!")
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
        if let MobileNumber = mobileTxt.text{
            let num = "\(countryCode)\(MobileNumber)"
            startloader()
            CheckLogin(MobileNo: MobileNumber)
        }
        
    }

    @IBAction func signUpBtn(_ sender: Any) {
        ScreensManager.shared.registerScceren(on: self, modal: true, animated: false)
    }
    
    func PlaceHolderColor(){
        mobileTxt.attributedPlaceholder = NSAttributedString(
            string: "Enter Mobile Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
    }
    
    func CheckLogin(MobileNo : String) {
        
        let url1 = registerPost + "/\(MobileNo)"
        APIManager.sharedInstance.requestGET(url1, success: { (response) in
            
            do {
                let throwables = try JSONDecoder().decode(registreduser.self, from: response.rawData())
                print(throwables)
                self.userLoginDetails = throwables
                if let userDat = self.userLoginDetails{
                    let MobilNo = Utils.unWrapString(string: throwables.mobileNo)
                    let num = "\(self.countryCode)\(MobilNo)"
                    SMSManager.shared.phoneVerification(PhoneNumber: num){ [weak self] success in
                        guard success else {
                            let alert = CommonAlertServices.shared.alertPresent(Text: "Please Enter Correct Mobile Number!")
                            self?.present(alert, animated: true, completion: nil)
                            return}
                        self?.endloader()
                        ScreensManager.shared.OTPScreen(userData: userDat, on: self, modal: true, animated: false)
                    }
                }
                //
                DispatchQueue.main.async(execute: {
                    
                })
                
            } catch let jsonErr {
                print(jsonErr)
                self.presentAlert("JSON Error Occured", jsonErr.localizedDescription)
            }
            
        }) { (err) in
            self.presentAlert("Error Occurred", err.localizedDescription)
        }
    }
}


extension SplashViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 13
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}


extension SplashViewController{
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 100
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}


extension SplashViewController{
    static func sendVerificationCode(_ countryCode: String, _ phoneNumber: String) {
        
        let parameters = [
            "via": "sms",
            "country_code": countryCode,
            "phone_number": phoneNumber
        ]
        
        let path = "start"
        let method = "POST"
        
        let urlPath = "\(baseURLString)/\(path)"
        var components = URLComponents(string: urlPath)!
        
        var queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        
        let url = components.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if let data = data {
                do {
                    let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    
                    print(jsonSerialized!)
                }  catch let error as NSError {
                    print(error.localizedDescription)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension SplashViewController: CountryPickerViewDelegate{
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print(country)
        countryCode = country.phoneCode
        countryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        countryBtn.setTitle(country.phoneCode, for: .normal)
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, willShow viewController: CountryPickerViewController) {
        print("")
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didShow viewController: CountryPickerViewController) {
        print("")
    }
    
}
