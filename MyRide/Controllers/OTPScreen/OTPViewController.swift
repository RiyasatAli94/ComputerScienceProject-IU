//
//  OTPViewController.swift
//  MyRide
//
//  Created by Keval Shah on 07/02/23.
//

import UIKit
import FirebaseAuth

class OTPViewController: UIViewController {
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var FirstDigit: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    var verifyOTPNumber = "1234"
    var userVerifyData: AuthDataResult!
    var userDetails : registreduser?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        hideKeyboardWhenTappedAround()
        NotificationObserver()
        FirstDigit.delegate = self
        
    }
    
    func setupDesign(){
        FirstDigit.cardView()
        nextBtn.layer.cornerRadius = 10
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if let MobileNumber = FirstDigit.text{
            if MobileNumber.count < 6 {
                let alert = CommonAlertServices.shared.alertPresent(Text: "Please Enter Correct OTP!")
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        startloader()
        if let code = FirstDigit.text{
            SMSManager.shared.codeVerify(verificationCode:  code){ [weak self] success,userData  in
                guard success else {
                    self?.endloader()
                    let alert = CommonAlertServices.shared.alertPresent(Text: "Please Enter Correct OTP!")
                    self?.present(alert, animated: true, completion: nil)
                    return}
                print(success)
                self?.userVerifyData = userData
                print(Utils.unWrapString(string: userData.user.phoneNumber))
                self?.endloader()
                UserDefaults.standard.set(true, forKey: isUserLogin)
                UserDefaults.standard.set(Utils.unWrapString(string: self?.userDetails?.mobileNo), forKey: User_Mobile_Number)
                UserDefaults.standard.set(Utils.unWrapString(string: self?.userDetails?.email), forKey: User_Email)
                UserDefaults.standard.set(Utils.unWrapString(string: self?.userDetails?.name), forKey: User_Name)
                UserDefaults.standard.set(Utils.unWrapString(string: self?.userDetails?.id), forKey: User_Id)
                UserDefaults.standard.set(Utils.unWrapString(string: self?.userDetails?.password), forKey: User_Password)
                ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
            }
        }
       
    }

    @IBAction func backBtn(_ sender: Any) {
        ScreensManager.shared.Home(on: self, modal: true, animated: false)
    }
   

}


extension OTPViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 6
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
}
