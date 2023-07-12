//
//  GroupDetailsCellTableViewCell.swift
//  MyRide
//
//  Created by Keval Shah on 27/04/23.
//

import UIKit

class GroupDetailsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var CellVView: UIView!
    @IBOutlet weak var RiderName: UILabel!
    @IBOutlet weak var RiderNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
