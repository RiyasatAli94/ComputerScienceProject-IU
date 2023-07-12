//
//  GroupDetailsViewController.swift
//  MyRide
//
//  Created by Keval Shah on 27/04/23.
//

import UIKit

class GroupDetailsViewController: UIViewController {

    @IBOutlet weak var GName: UILabel!
    @IBOutlet weak var GImg: UIImageView!
    
    @IBOutlet weak var GDetials: UILabel!
    
    @IBOutlet weak var GTBView: UITableView!
    var groupModel : GroupsModel!
    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataDecoded:NSData = NSData(base64Encoded: Utils.unWrapString(string: groupModel.groupImg), options: NSData.Base64DecodingOptions(rawValue: 0))!
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        GImg.image = decodedimage
        GName.text = Utils.unWrapString(string: groupModel.gorupName)
        GDetials.text = Utils.unWrapString(string: groupModel.groupDetails)
        nameArray = Utils.unWrapString(string: groupModel.groupRiderList).components(separatedBy: ",")
        GTBView.dataSource = self
        GTBView.delegate = self
        GImg.layer.cornerRadius = 50
        
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension GroupDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupDetailsCellTableViewCell", for: indexPath) as! GroupDetailsCellTableViewCell
        cell.RiderName.text = nameArray[indexPath.row]
        cell.RiderNumber.text = "NA"
        return cell
    }
    
    
}
