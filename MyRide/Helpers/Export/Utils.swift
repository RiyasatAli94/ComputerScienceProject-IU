//
//  Utils.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 05/03/22.
//  Copyright © 2022 Irfan Ajmeri. All rights reserved.
//

import Foundation

class Utils{
    static func unWrapString(string : Optional<Any>) -> String{
        var strValue = String()
        if let str = string{
            strValue = "\(str)"
        }
        return strValue
    }
    
    static func unWrapInt(int : Optional<Int>) -> Int{
        var intValue = Int()
        if let int1 = int{
            intValue = int1
        }
        return intValue
    }
    
    static func unWrapBool(BoolTye : Optional<Bool>) -> Bool{
        var intValue = Bool()
        if let int1 = BoolTye{
            intValue = int1
        }
        return intValue
    }
    
    
    static func unWrapData(int : Optional<Data>) -> Data{
        var intValue = Data()
        if let int1 = int{
            intValue = int1
        }
        return intValue
    }
    
    static func selectDate(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(date)")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date1!)
    }
    
    static func expiryDate(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(date)")
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date1!)
    }
    
    static func dateTime(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(date)")
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date1!)
    }
    
    static func date(date : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date1 = formatter.date(from: "\(date)")
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date1! )
    }
    
    static func time(date : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date1 = formatter.date(from: "\(date)")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date1!)
    }
    
    
    static func printFun(txt : String){
        print(txt)
    }
    
    static func currentDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(Date())")
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date1!)
    }
    
    static func currentDateTime() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(Date())")
        formatter.dateFormat = "MMM d, h:mm a"
        return formatter.string(from: date1!)
    }
    
    static func uniqueNumberGenerate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date1 = formatter.date(from: "\(Date())")
        formatter.dateFormat = "yyyyMMddHHmmss"
        return formatter.string(from: date1!)
    }
    
    static func stringTodate(stringDate : String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:stringDate)!
        return date
    }
    
    static func currentDateInDate() -> Date{
        let current = currentDate()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:current)!
        return date
    }
    
}
