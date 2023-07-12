//
//  Bike+API.swift
//  MyRide
//
//  Created by Keval Shah on 27/03/23.
//

import Foundation
import Alamofire

extension BikeDetailsViewController{
    func postBikeDetails(){
        let Para : Parameters = [
            "brandName": Utils.unWrapString(string: Brand_txt.text),
            "bikeModel": Utils.unWrapString(string: Bike_txt.text),
            "bikeName": Utils.unWrapString(string: bikeName_txt.text),
            "registrationNo": Utils.unWrapString(string: RegisterNumber_txt.text),
            "country": Utils.unWrapString(string: Country_txt.text),
            "km": Utils.unWrapString(string: KM_txt.text),
            "ryear": Utils.unWrapString(string: year_txt.text),
            "color": Utils.unWrapString(string: color_txt.text),
            "cc": Utils.unWrapString(string: cc_txt.text),
            "mobileNo": UserMobile(),
            "bikeId": 0
        ]
        BikeRegister(Para)
    }
    
    func BikeRegister(_ request: Parameters) {
        let url = bikeRegisterUrl
        APIManager.sharedInstance.requestPOST(url, params: request, success: { (response) in
            self.endloader()
            self.showPop(text: "Your bike is register with your profile.")
        }) { (err) in
            self.showPop(text: "Error Occur")
        }
    }
}
