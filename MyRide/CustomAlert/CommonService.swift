//
//  CommonService.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import Foundation
import UIKit


class CommonAlertServices{
    static var shared = CommonAlertServices()
    func alertPresent(Text : String) -> AlertViewController{
        let story = UIStoryboard(name: "Alert", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        alert.text = Text
        return alert
    }
    
    func sideMenuButton() -> SideMenuViewController{
        let story = UIStoryboard(name: "Dashboard", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        return alert
    }
    
    func StartLoader() -> LoaderViewController{
        let story = UIStoryboard(name: "Alert", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "LoaderViewController") as! LoaderViewController
        return alert
    }
    
    func SingleImageUpload() -> SingleImageUploadViewController{
        let story = UIStoryboard(name: "Alert", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "SingleImageUploadViewController") as! SingleImageUploadViewController
        return alert
    }
    
    func SearchBarView(BikeData : [String],BikeId: [Int], tag : Int) -> SearchBarViewController{
        let story = UIStoryboard(name: "Profile", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "SearchBarViewController") as! SearchBarViewController
        alert.DataModelName = BikeData
        alert.DataModelId = BikeId
        alert.tag = tag
        return alert
    }
    
    func DatePicker(isDate : Bool) -> DateViewController{
        let story = UIStoryboard(name: "DatePicker", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "DateViewController") as! DateViewController
        alert.isDate = isDate
        return alert
    }
    
    func dayPicker() -> DayPickerViewController{
        let story = UIStoryboard(name: "DatePicker", bundle: .main)
        let alert = story.instantiateViewController(withIdentifier: "DayPickerViewController") as! DayPickerViewController
        return alert
    }
}
