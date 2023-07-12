//
//  MessageTableViewCell.swift
//  MyRide
//
//  Created by Keval Shah on 26/04/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var senderName: UILabel!
    
    @IBOutlet weak var senderNameLbl: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    
    var setterObj: MessageModel? {
        
        didSet {
            let name = Utils.unWrapString(string: setterObj?.senderName).prefix(1)
            senderName.text = String(name)
            senderNameLbl.text = Utils.unWrapString(string: setterObj?.senderName)
            time.text =  Utils.unWrapString(string: setterObj?.date)
            message.text = Utils.unWrapString(string: setterObj?.message)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.cardView()
        senderName.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
