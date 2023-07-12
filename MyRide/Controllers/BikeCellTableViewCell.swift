//
//  BikeCellTableViewCell.swift
//  MyRide
//
//  Created by Keval Shah on 28/03/23.
//

import UIKit

class BikeCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bikeName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    
    @IBOutlet weak var model: UILabel!
    
    @IBOutlet weak var RegisrationNo: UILabel!
    
    @IBOutlet weak var Country: UILabel!
    
    @IBOutlet weak var KM: UILabel!
    @IBOutlet weak var RegisterYear: UILabel!
    
    @IBOutlet weak var cc: UILabel!
    
    
    
    var setterObj: BikeModel? {
        
        didSet {
            //
            if let bikeNamesting = setterObj?.bikeName, !bikeNamesting.isEmpty {
                bikeName.text = bikeNamesting
            } else {
                bikeName.attributedText = getCustomBoldAttributedText(15, "" + ": ", "-")
            }
            
            //
            if let brandNameString = setterObj?.brandName, !brandNameString.isEmpty {
                brandName.attributedText = getCustomBoldAttributedText(15, "Brand Name" + ": ", brandNameString)
            } else {
                brandName.attributedText = getCustomBoldAttributedText(15, "Brand Name" + ": ", "-")
            }
            
            //
            if let modelString = setterObj?.bikeModel, !modelString.isEmpty {
                model.attributedText = getCustomBoldAttributedText(15, "Bike Model" + ": ", modelString)
            } else {
                model.attributedText = getCustomBoldAttributedText(15, "Bike Model" + ": ", "-")
            }
            
            //
            if let Registration = setterObj?.registrationNo, !Registration.isEmpty {
                RegisrationNo.attributedText = getCustomBoldAttributedText(15, "Registration No" + ": ", Registration)
            } else {
                RegisrationNo.attributedText = getCustomBoldAttributedText(15, "Registration NO" + ": ", "-")
            }
            
            //
            if let countrylbl = setterObj?.country, !countrylbl.isEmpty {
                Country.attributedText = getCustomBoldAttributedText(15, "Country/City" + ": ", countrylbl)
            } else {
                Country.attributedText = getCustomBoldAttributedText(15, "Country/City" + ": ", "-")
            }
            
            //
            if let kmstring = setterObj?.km, !kmstring.isEmpty {
                KM.attributedText = getCustomBoldAttributedText(15, "Kilometer Driven" + ": ", "\(kmstring) KM")
            } else {
                KM.attributedText = getCustomBoldAttributedText(15, "Kilometer Driven" + ": ", "-")
            }
            
            //
            if let year = setterObj?.ryear, !year.isEmpty {
                RegisterYear.attributedText = getCustomBoldAttributedText(15, "Register Year" + ": ", year)
            } else {
                RegisterYear.attributedText = getCustomBoldAttributedText(15, "Register Year" + ": ", "-")
            }
            
            //
            if let bikecc = setterObj?.cc, !bikecc.isEmpty {
                cc.attributedText = getCustomBoldAttributedText(15, "Bike CC" + ": ", bikecc)
            } else {
                cc.attributedText = getCustomBoldAttributedText(15, "Bike CC" + ": ", "-")
            }

        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
