//
//  Extensions.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 06/02/20.
//  Copyright © 2020 Irfan Ajmeri. All rights reserved.
//

import UIKit
//
// MARK:- extension UIColor
//
extension UIColor {
    //
    // MARK:- iOS Colors
    // Reference :- https://developer.apple.com/ios/human-interface-guidelines/visual-design/color/
    //
    class var customRed: UIColor {
        return UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.0) // FF3B30
    }
    
    class var customOrange: UIColor {
        return UIColor(red:1.00, green:0.58, blue:0.00, alpha:1.0) // FF9500
    }
    
    class var customYellow: UIColor {
        return UIColor(red:1.00, green:0.80, blue:0.00, alpha:1.0) // FFCC00
    }
    
    class var customGreen: UIColor {
        return UIColor(red:0.30, green:0.85, blue:0.39, alpha:1.0) // 4CD964
    }
    
    class var customTealBlue: UIColor {
        return UIColor(red:0.35, green:0.78, blue:0.98, alpha:1.0) // 5AC8FA
    }
    
    class var customBlue: UIColor {
        return UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0) // 007AFF
    }
    
    class var customPurple: UIColor {
        return UIColor(red:0.35, green:0.34, blue:0.84, alpha:1.0) // 5856D6
    }
    
    class var customPink: UIColor {
        return UIColor(red:1.00, green:0.18, blue:0.33, alpha:1.0) // FF2D55
    }
    
    //
    // MARK:- Material Design Colors
    // Reference :- https://www.materialui.co/colors
    //
    class var redMd: UIColor {
        return UIColor(red:0.96, green:0.26, blue:0.21, alpha:1.0) // F44336
    }
    
    class var pinkMd: UIColor {
        return UIColor(red:0.91, green:0.12, blue:0.39, alpha:1.0) // E91E63
    }
    
    class var purpleMd: UIColor {
        return UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.0) // 9C27B0
    }
    
    class var deepPurpleMd: UIColor {
        return UIColor(red:0.40, green:0.23, blue:0.72, alpha:1.0) // 673AB7
    }
    
    class var indigoMd: UIColor {
        return UIColor(red:0.25, green:0.32, blue:0.71, alpha:1.0) // 3F51B5
    }
    
    class var blueMd: UIColor {
        return UIColor(red:0.13, green:0.59, blue:0.95, alpha:1.0) // 2196F3
    }
    
    class var lightBlueMd: UIColor {
        return UIColor(red:0.01, green:0.66, blue:0.96, alpha:1.0) // 03A9F4
    }
    
    class var cyanMd: UIColor {
        return UIColor(red:0.00, green:0.74, blue:0.83, alpha:1.0) // 00BCD4
    }
    
    class var tealMd: UIColor {
        return UIColor(red:0.00, green:0.59, blue:0.53, alpha:1.0) // 009688
    }
    
    class var greenMd: UIColor {
        return UIColor(red:0.30, green:0.69, blue:0.31, alpha:1.0) // 4CAF50
    }
    
    class var greenMiddleMd: UIColor {
        return UIColor(red:0.30, green:0.90, blue:0.39, alpha:1.0) // #6BCE23
    }
    
    class var subHeaderBarColor: UIColor {
        return UIColor(red: 0.93, green: 0.44, blue: 0.32, alpha: 1.00) // #EC7051
    }
    
    class var lightGreenMd: UIColor {
        return UIColor(red:0.55, green:0.76, blue:0.29, alpha:1.0) // 8BC34A
    }
    
    class var limeMd: UIColor {
        return UIColor(red:0.80, green:0.86, blue:0.22, alpha:1.0) // CDDC39
    }
    
    class var yellowMd: UIColor {
        return UIColor(red:1.00, green:0.92, blue:0.23, alpha:1.0) // FFEB3B
    }
    
    class var amberMd: UIColor {
        return UIColor(red:1.00, green:0.76, blue:0.03, alpha:1.0) // FFC107
    }
    
    class var orangeMd: UIColor {
        return UIColor(red:1.00, green:0.60, blue:0.00, alpha:1.0) // FF9800
    }
    
    class var deepOrangeMd: UIColor {
        return UIColor(red:1.00, green:0.34, blue:0.13, alpha:1.0) // FF5722
    }
    
    class var brownMd: UIColor {
        return UIColor(red:0.47, green:0.33, blue:0.28, alpha:1.0) // 795548
    }
    
    class var grayMd: UIColor {
        return UIColor(red:0.62, green:0.62, blue:0.62, alpha:1.0) // 9E9E9E
    }
    
    class var blueGreyMd: UIColor {
        return UIColor(red:0.38, green:0.49, blue:0.55, alpha:1.0) // 607D8B
    }
    
    class var headerbarcolor: UIColor{
        return UIColor(red: 0.47, green: 0.64, blue: 0.81, alpha: 1.00)
    }
    
    //
    // MARK:- App Theme Colors
    //
    class var navBar: UIColor {
        return UIColor(red:0.72, green:0.07, blue:0.13, alpha:1.0) // B81221
    }
    
    class var navBarSecondary: UIColor {
        return UIColor(red: 0.00, green: 0.46, blue: 0.76, alpha: 1.00) // 0075C2
    }
    
    class var coolBackground: UIColor {
        return UIColor(red:0.91, green:0.92, blue:0.98, alpha:1.0) // E7EBFB
    }
    
    class var coolBackgroundShadow: UIColor {
        return UIColor(red:0.50, green:0.54, blue:0.88, alpha:1.0) // 808AE0
    }
    
    class var tableViewBackground: UIColor {
        return UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0) // E7E7E7
    }
    
    class var imageViewBackground: UIColor {
        return UIColor(red: 0.94, green: 0.94, blue: 0.96, alpha: 1.0) // EFF0F5
    }
    
    class var titleLabel: UIColor {
        return UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.0) // 212121
    }
    
    class var subtitleLabel: UIColor {
        return UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0) // 555555
    }
    
    class var separator: UIColor {
        return UIColor(white: 0.5, alpha: 0.5)
    }
    
    class var semiTransparentBlack: UIColor {
        return UIColor(white: 0, alpha: 0.5)
    }
    
    class var redDismiss: UIColor {
        return UIColor(red:0.67, green:0.07, blue:0.07, alpha:1.0) // AA1213
    }
    
    class var darkBlue: UIColor {
        return UIColor(red:0.08, green:0.24, blue:0.57, alpha:1.0) // 153E92
    }

    class var darkGreen: UIColor {
        return UIColor(red: 0.14, green: 0.54, blue: 0.23, alpha: 1.00) // 238A3B
    }
    
    //
    // MARK:- Dashboard Chart Colors
    //
    class var TotalCountColor: UIColor {
        return UIColor(red:0.01, green:0.46, blue:0.76, alpha:1.0) // 0275c2
    }
    
    class var ClosedCountColor: UIColor {
        return UIColor(red:0.10, green:0.69, blue:0.36, alpha:1.0) // 1aaf5d
    }
    
    class var OpenCountColor: UIColor {
        return UIColor(red:0.95, green:0.77, blue:0.00, alpha:1.0) // f2c500
    }
    
    class var SingleYellowColor: UIColor {
        return UIColor(red:0.95, green:0.77, blue:0.00, alpha:1.0) // f2c500
    }
}

//
// MARK:- UIColor Conversion hex -> str
//
extension UIColor {
    
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

//
// MARK:- extension UIViewController
//
extension UIViewController {
    
    //
    // MARK:- removeBackBarButtonItemTitle
    //
    func removeBackBarButtonItemTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //
    // MARK:- Toast Mesaage
    //
    func showToast(_ message: String) {
        
        //
        let toastLbl = UILabel(frame: CGRect(x: 20, y: screenHeight - (yCoordinate + 68), width: screenWidth - 40, height: 40))
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toastLbl.text = " \(message) "
        toastLbl.textColor = UIColor.white
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 15)
        toastLbl.numberOfLines = 2
        toastLbl.alpha = 1.0
        toastLbl.layer.cornerRadius = 5
        toastLbl.clipsToBounds = true
        view.addSubview(toastLbl)
        
        UIView.animate(withDuration: 0.25, delay: 2.50, options: .curveEaseOut, animations: {
            toastLbl.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLbl.removeFromSuperview()
        })
    }
    
    //
    // MARK:- presentAlert
    //
    func presentAlert(_ title: String, _ message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActionBT = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(okActionBT)
        DispatchQueue.main.async {
            viewControllerUtils.hideLoader()
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

//
// MARK:- prettyPrint
//
extension Dictionary where Key == String, Value == Any {
    
    func prettyPrint() -> String {
        
        var string: String = ""
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) {
            if let nstr = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                string = nstr
            }
        }
        return string
    }
}

//
// MARK:- String to Date Conversion
//
extension String {
    
    func toDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func toDateForTime() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = twentyFourHourTimeFormat
        let date = dateFormatter.date(from: self)
        return date
    }
}

//
// MARK:- Date to String Conversion
//
extension Date {
    
    func toString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = dateFormat
        let dateInStr = dateFormatter.string(from: self)
        return dateInStr
    }
    
    func daysBetweenDate(toDate: Date) -> Int {
        
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
}

//
// MARK:- Setting up default date on UIDatePicker
//
extension UIDatePicker {
    
    func setDate(from string: String, format: String, animated: Bool = true) {
        
        let formater = DateFormatter()
        formater.dateFormat = format
        let date = formater.date(from: string) ?? Date()
        setDate(date, animated: animated)
    }
}

//
// MARK:- Finding respective date from Calendar
//
extension Calendar {
    
    func dayOfWeek(_ date: Date) -> Int {
        var dayOfWeek = self.component(.weekday, from: date) + 1 - self.firstWeekday
        
        if dayOfWeek <= 0 {
            dayOfWeek += 7
        }
        
        return dayOfWeek
    }
    
    func startOfWeek(_ date: Date) -> Date {
        return self.date(byAdding: DateComponents(day: -self.dayOfWeek(date) + 1), to: date)!
    }
    
    func endOfWeek(_ date: Date) -> Date {
        return self.date(byAdding: DateComponents(day: 6), to: self.startOfWeek(date))!
    }
    
    func startOfMonth(_ date: Date) -> Date {
        return self.date(from: self.dateComponents([.year, .month], from: date))!
    }
    
    func endOfMonth(_ date: Date) -> Date {
        return self.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth(date))!
    }
    
    func startOfYear(_ date: Date) -> Date {
        return self.date(from: self.dateComponents([.year], from: date))!
    }
}

//
// MARK:- CurrentMonth
//
extension Date {
    
    var currentMonth: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
}

//
// MARK:- Extension+Images
//
extension UIImage {
    
    static let uncheckRadioImg = UIImage(named: "ic_radio_uncheck")
    static let checkedRadioImg = UIImage(named: "ic_radio_checked")
    
    static let uncheckWhiteRedioImg = UIImage(named: "radio-white")
    static let checkWhiteRedioImg = UIImage(named: "radio-white-selected")
    //
    static let uncheckCheckBoxImg = UIImage(named:"ic_check_box_outline_blank")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    static let checkedCheckBoxImg = UIImage(named:"ic_check_box")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    //
    static let approvalImg = UIImage(named: "ic_common_approval")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
}

//static let checkedRadioImg = UIImage(named: "ic_radio_checked")

//
// MARK:- Image Compression :: https://gist.github.com/akshay1188/4749253
//
extension UIImage {
    
    func compressImage() -> UIImage? {
        
        // Reducing file size to a 10th
        var actualHeight: CGFloat = self.size.height
        var actualWidth: CGFloat = self.size.width
        let maxHeight: CGFloat = 1136.0
        let maxWidth: CGFloat = 640.0
        var imgRatio: CGFloat = actualWidth/actualHeight
        let maxRatio: CGFloat = maxWidth/maxHeight
        var compressionQuality: CGFloat = 0.5  // 50 percent compression
        
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            } else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            } else {
                actualHeight = maxHeight
                actualWidth = maxWidth
                compressionQuality = 1
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        guard let imageData = img.jpegData(compressionQuality: compressionQuality) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

//
// MARK:- getFileSizeInfo
//
extension String {
    
    func getNumbers() -> [NSNumber] {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let charset = CharacterSet.init(charactersIn: " ,.")
        return matches(for: "[+-]?([0-9]+([., ][0-9]*)*|[.][0-9]+)").compactMap { string in
            return formatter.number(from: string.trimmingCharacters(in: charset))
        }
    }
    
    // https://stackoverflow.com/a/54900097/4488252
    func matches(for regex: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: [.caseInsensitive]) else { return [] }
        let matches  = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.compactMap { match in
            guard let range = Range(match.range, in: self) else { return nil }
            return String(self[range])
        }
    }
}

extension UIImage {
    
    func getFileSizeInfo(allowedUnits: ByteCountFormatter.Units = .useMB,
                         countStyle: ByteCountFormatter.CountStyle = .file) -> String? {
        // https://developer.apple.com/documentation/foundation/bytecountformatter
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.countStyle = countStyle
        return getSizeInfo(formatter: formatter)
    }
    
    func getFileSize(allowedUnits: ByteCountFormatter.Units = .useMB,
                     countStyle: ByteCountFormatter.CountStyle = .memory) -> Double? {
        guard let num = getFileSizeInfo(allowedUnits: allowedUnits, countStyle: countStyle)?.getNumbers().first else { return nil }
        return Double(truncating: num)
    }
    
    func getSizeInfo(formatter: ByteCountFormatter, compressionQuality: CGFloat = 1.0) -> String? {
        guard let imageData = jpegData(compressionQuality: compressionQuality) else { return nil }
        return formatter.string(fromByteCount: Int64(imageData.count))
    }
}

//
// MARK:- popToViewController
//
extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
}

//
// MARK:- setLine on UIView
//
extension UIView {
    
    func showToast(_ message: String) {
        
        guard let window = UIApplication.shared.keyWindow else {return}
        //
        let toastLbl = UILabel(frame: CGRect(x: 20, y: screenHeight - (yCoordinate + 68), width: screenWidth - 40, height: 40))
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toastLbl.text = " \(message) "
        toastLbl.textColor = UIColor.white
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 15)
        toastLbl.numberOfLines = 2
        toastLbl.alpha = 1.0
        toastLbl.layer.cornerRadius = 5
        toastLbl.clipsToBounds = true
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 0.25, delay: 2.50, options: .curveEaseOut, animations: {
            toastLbl.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLbl.removeFromSuperview()
        })
    }
    
    enum Line_Position {
        case top
        case bottom
    }
    
    func setLine(position: Line_Position, color: UIColor, height: Double) {
        
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width": NSNumber(value: height)]
        let views = ["lineView": lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
            
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

//
// MARK:- UITextField underlined
//
extension UITextField {
    
    func underlined() {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

//
// MARK:- UICollectionView scrollToLast
//
extension UICollectionView {
    
    func scrollToLast() {
        
        guard numberOfSections > 0 else {
            return
        }
        
        let lastSection = numberOfSections - 1
        
        guard numberOfItems(inSection: lastSection) > 0 else {
            return
        }
        
        let lastItemIndexPath = IndexPath(item: numberOfItems(inSection: lastSection) - 1, section: lastSection)
        scrollToItem(at: lastItemIndexPath, at: .left, animated: true)
    }
}

//
// MARK:- UITextView PlaceHolder
//
/// Extend UITextView and implemented UITextViewDelegate to listen for changes
extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = .systemFont(ofSize: 16)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let numberOfChars = (textView.text as NSString).replacingCharacters(in: range, with: text).count
        //
        switch textView.tag {
            
        case 500:
            return numberOfChars <= 500
            
        case 1000:
            return numberOfChars <= 1000
            
        default:
            return numberOfChars <= 140
        }
    }
}

//
// MARK:- isImageType
//
extension String {
    
    func isImageType() -> Bool {
        
        // image formats which you want to check
        let imageFormats = ["png", "jpg", "jpeg"]
        
        if URL(string: self) != nil  {
            let extensi = (self as NSString).pathExtension
            return imageFormats.contains(extensi)
        }
        return false
    }
}

//
// Mark:- ITS -> Notification Name
//
extension Notification.Name {
    static let openWitnessNotification = Notification.Name("witness")
    static let deleteWitnessNotification = Notification.Name("witnessDelete")
    static let openWitnessEmployeeNotification = Notification.Name("witnessEmployee")
    static let openPreviewNotification = Notification.Name("previewImage")
    static let deleteAttachmentNotification = Notification.Name("removeAttachment")
    static let openAttachmentNotification = Notification.Name("openAttachment")
    static let openCameraNotification = Notification.Name("openCamera")
    static let openGalleryNotification = Notification.Name("openGallery")
    static let showWitnessDepartment = Notification.Name("showWitnessDepartment")
    static let showWitnessEmployee = Notification.Name("showWitnessEmployee")
    static let numberListcontorller = Notification.Name("numberlist")
    static let gesTestingTime = Notification.Name("gesTestingTime")
    static let renewExpiryDateforCVM = Notification.Name("renewExpiryDateforCVM")
    static let WPSearchSelectedType = Notification.Name("WPSearchSelectedType")
    static let WPSearchData = Notification.Name("WPSearchData")
    static let getDocuments = Notification.Name("documents")
    static let selectedCommonPop = Notification.Name("selectedCommonPop")
    static let cacHrApproval = Notification.Name("isSubmit")
//    static let openReportedEmployeeNotification = Notification.Name("reportedemployee")
//    static let openReviewUserEmailNotificaiton = Notification.Name("reviewUserEmail")
//    static let openIncidentLedToNotification = Notification.Name("incidentLedTo")
//    static let openWitnessContractorNotification = Notification.Name("witnessContractor")
//    static let openProbability = Notification.Name("openProbability")
//    static let openSeverity = Notification.Name("openSeverity")
//    static let openRiskRating = Notification.Name("openRiskRating")
}

extension UITextField {
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}

// UIScrollView
extension UIScrollView {
    
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y,width: 1,height: self.frame.height), animated: animated)
        }
    }
}
