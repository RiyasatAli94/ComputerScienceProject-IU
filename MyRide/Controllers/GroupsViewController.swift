//
//  GroupsViewController.swift
//  MyRide
//
//  Created by Keval Shah on 11/03/23.
//

import UIKit
import Alamofire

class GroupsViewController: UIViewController {

    @IBOutlet weak var groupDetailsView: UIView!
    @IBOutlet weak var groupImg: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupDetails: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var SendBtn_Outlet: UIButton!
    @IBOutlet weak var messageTxt: UITextField!
    @IBOutlet weak var messageTB: UITableView!
    var groupModel : GroupsModel!
    var messageModel : [MessageModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id = Utils.unWrapString(string: groupModel.gourpID)
        Getdata(id: id)
        setData()
        messageTB.delegate = self
        messageTB.dataSource = self
        messageTB.transform = CGAffineTransform(scaleX: 1, y: -1)
        

        
    }
    
    func updateTableContentInset() {
        let numRows = self.messageTB.numberOfRows(inSection: 0)
        var contentInsetTop = self.messageTB.bounds.size.height
        for i in 0..<numRows {
            let rowRect = self.messageTB.rectForRow(at: IndexPath(item: i, section: 0))
            contentInsetTop -= rowRect.size.height
            if contentInsetTop <= 0 {
                contentInsetTop = 0
                break
            }
        }
        self.messageTB.contentInset = UIEdgeInsets(top: contentInsetTop,left: 0,bottom: 0,right: 0)
    }

    @IBAction func sendBtnAction(_ sender: Any) {
        if Utils.unWrapString(string: messageTxt.text) != ""{
            messageTxt.text = ""
            let para : Parameters = [
                "groupId": Utils.unWrapString(string: groupModel.gourpID),
                "messageId": UUID().uuidString,
                "message": Utils.unWrapString(string: messageTxt.text),
                "senderId": UserId(),
                "senderName": UserName(),
                "date": Utils.currentDateTime()
            ]
            postMessage(para)
        }else{
            self.showToast("Enter Message")
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        ScreensManager.shared.Dashboard(on: self, modal: true, animated: false)
    }
    
    @IBAction func moreMenuBTn(_ sender: Any) {
        ScreensManager.shared.GroupDetailsScreen(groupData: groupModel, on: self, modal: true, animated: false)
    }
    
    func setData(){
        let dataDecoded:NSData = NSData(base64Encoded: Utils.unWrapString(string: groupModel.groupImg), options: NSData.Base64DecodingOptions(rawValue: 0))!
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        groupImg.image = decodedimage
        groupName.text = Utils.unWrapString(string: groupModel.gorupName)
        groupDetails.text = Utils.unWrapString(string: groupModel.groupDetails)
        titleLbl.text = Utils.unWrapString(string: groupModel.gorupName)
        groupImg.layer.cornerRadius = 17
    }
    
    func Getdata(id : String){
        //startloader()
        let url1 = messageURL + "/GetData/\(id)"
        APIManager.sharedInstance.requestGET(url1, success: { (response) in
            
            do {
                let throwables = try JSONDecoder().decode([MessageModel].self, from: response.rawData())
                print(throwables)
                //self.endloader()
                let modelss = throwables
                
            self.messageModel = throwables
                    
                

                self.messageTB.reloadData()
            } catch let jsonErr {
                print(jsonErr)
                self.presentAlert("JSON Error Occured", jsonErr.localizedDescription)
            }
            
        }) { (err) in
            self.presentAlert("Error Occurred", err.localizedDescription)
        }
    }
    
    func postMessage(_ request: Parameters) {
        let url = messageURL
        APIManager.sharedInstance.requestPOST(url, params: request, success: { (response) in
            let id = Utils.unWrapString(string: self.groupModel.gourpID)
            self.Getdata(id: id)
        }) { (err) in
            self.showToast("Error Found!")
        }
    }
    
    func postLast(id : String) {
        
        let lastMes = Utils.unWrapString(string: messageTxt.text)
        let lastseen = Utils.currentDateTime()
        
        let para : Parameters = [
              "groupLastMessage": lastMes,
              "groupLastSeen": lastseen
        ]
        
        let url = GroupsURL + "/UpdateLastMessage/\(id)"
        APIManager.sharedInstance.requestPUTwithMethod(url, params: para, success: { (response) in
            self.showToast("Message Sent")
        }) { (err) in
            self.showToast("Error Found!")
        }
        
        
    }
}


extension UIViewController{
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
