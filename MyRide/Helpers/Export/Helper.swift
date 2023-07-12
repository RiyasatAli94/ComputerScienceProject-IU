//
//  Helper.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 06/02/20.
//  Copyright © 2020 Irfan Ajmeri. All rights reserved.
//

import UIKit
//
// MARK:- currentLocalDate
//
func currentLocalDate() -> Date? {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let currentDate = dateFormatter.string(from: date)
    return currentDate.toDate() ?? nil
}

//
// MARK:- currentLocalTime24
//
func currentLocalTime24() -> Date? {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = twentyFourHourTimeFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let currentDate = dateFormatter.string(from: date)
    return currentDate.toDateForTime() ?? nil
}

//
// MARK:- currentLocalDateInStr
//
func currentLocalDateInStr() -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: date)
}

//
// MARK:- currentLocalTime24InStr
//
func currentLocalTime24InStr() -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = twentyFourHourTimeFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: date)
}

//
// MARK:- currentLocalDateInStrForFileUpload
//
func currentLocalDateInStrForFileUpload() -> String {
    
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormatForFileUpload
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.string(from: date)
}

//
// MARK:- convertTDateFormat
//
func convertTDateFormat(_ dateInStr: String) -> String? {
    
    //
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = dateFormatter.date(from: dateInStr) {
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    return nil
}

//
// MARK:- MIS Report Helpers
//
func getMonthsWithShortName() -> [String] {
    
    //
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    //
    if let monthsWithShortName = dateFormatter.shortMonthSymbols {
        return monthsWithShortName
    }
    return ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
}
//
func getSelectedMonthIndex() -> Int {
    
    //
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    //
    if let month = dateFormatter.calendar?.component(.month, from: date) {
        return month - 1
    }
    return 0
}
//
func getSelectedMonth() -> Int {
    
    //
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    //
    if let month = dateFormatter.calendar?.component(.month, from: date) {
        return month
    }
    return 1
}

//
// MARK:- jsonToString
//
func jsonToString(jsonToConvert: AnyObject) -> String? {
    
    do {
        let data =  try JSONSerialization.data(withJSONObject: jsonToConvert, options: JSONSerialization.WritingOptions.prettyPrinted)
        let convertedString = String(data: data, encoding: String.Encoding.utf8)
        print(convertedString as Any)
        return convertedString
        
    } catch let myJSONError {
        print(myJSONError)
        return nil
    }
}

//
// MARK:- getCustomAttributedText
//
func getCustomAttributedText(_ fontSize: CGFloat, _ firstStr: String, _ lastStr: String) -> NSAttributedString {
    
    //
    let normalFontAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.titleLabel,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    ]
    
    let mediumFontAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.titleLabel,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
    ]
    
    let partOne = NSMutableAttributedString(string: firstStr, attributes: normalFontAttributes)
    let partTwo = NSMutableAttributedString(string: lastStr, attributes: mediumFontAttributes)
    
    partOne.append(partTwo)
    return partOne
}

//
// MARK:- getCustomBoldAttributedText
//
func getCustomBoldAttributedText(_ fontSize: CGFloat, _ firstStr: String, _ lastStr: String) -> NSAttributedString {
    
    //
    let normalFontAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.titleLabel,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    ]
    
    let mediumFontAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.subtitleLabel,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)
    ]
    
    let partOne = NSMutableAttributedString(string: firstStr, attributes: normalFontAttributes)
    let partTwo = NSMutableAttributedString(string: lastStr, attributes: mediumFontAttributes)
    
    //
    partOne.append(partTwo)
    // *** Create instance of `NSMutableParagraphStyle`
    let paragraphStyle = NSMutableParagraphStyle()
    
    // *** set LineSpacing property in points ***
    paragraphStyle.lineSpacing = 3 // Whatever line spacing you want in points
    
    // *** Apply attribute to string ***
    partOne.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, partOne.length))
    //
    return partOne
}

//
// MARK:- convertBase64StringToImage
//
func convertBase64StringToImage(_ imageBase64String: String) -> UIImage? {
    //
    if let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0)) {
        return UIImage(data: imageData)
    }
    return nil
}

//
// MARK:- mandatoryAttributedText // extra
//
func mandatoryAttributedText() -> NSAttributedString {
    
    let firstAttribute = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium),
        NSAttributedString.Key.foregroundColor : UIColor.navBar
    ]
    
    let secondAttribute = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
        NSAttributedString.Key.foregroundColor : UIColor.redMd
    ]
    
    let partOne = NSMutableAttributedString(string: "Lead Passenger Name", attributes: firstAttribute)
    let partTwo = NSMutableAttributedString(string: " *", attributes: secondAttribute)
    
    partOne.append(partTwo)
    return partOne
}

/* extra code
{
    "Name": "Contractor and Visitor Management",
    "IsActive": true,
    "ImageName": "ic_module_cs"
},
*/


extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
