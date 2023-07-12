//
//  SMSManager.swift
//  MyRide
//
//  Created by Keval Shah on 10/03/23.
//

import Foundation
import FirebaseAuth

class SMSManager{
    static let shared = SMSManager()
    
    private let auth = Auth.auth()
    var OtpResponse: AuthDataResult!
    var verificationId = String()
    
    public func phoneVerification(PhoneNumber : String, completion : @escaping (Bool) -> Void){
        PhoneAuthProvider.provider().verifyPhoneNumber(PhoneNumber, uiDelegate: nil){ [weak self] verificationId, error in
            guard let verificationId = verificationId, error == nil else{
                completion(false)
                return
            }
            self?.verificationId = verificationId
            completion(true)
        }
    }
    
    public func codeVerify(verificationCode : String, completion : @escaping (Bool,AuthDataResult) -> Void){
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: verificationCode)
        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else{
                if let res = result{
                    completion(false, res)
                }
                return
            }
            if let res = result{
                print(result as Any)
                completion(true, res)
            }
            
            
        }
    }
}
