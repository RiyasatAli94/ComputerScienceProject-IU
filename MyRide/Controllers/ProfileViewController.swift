//
//  ProfileViewController.swift
//  MyRide
//
//  Created by Keval Shah on 27/03/23.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var ViewTitleLbl: UILabel!
    @IBOutlet weak var TitleView: UIView!
    
    @IBOutlet weak var TitlebackBtn: UIButton!
    
    @IBOutlet weak var ProfileImg: UIImageView!
    
    @IBOutlet weak var UserNamelbl: UILabel!
    
    @IBOutlet weak var ChangePhotoBtn: UIButton!
    
    @IBOutlet weak var EnterName_txt: UITextField!
    
    @IBOutlet weak var EnterEmail_txt: UITextField!
    
    @IBOutlet weak var EnterMobileNumber_txt: UITextField!
    
    @IBOutlet weak var EnterDOB_txt: UITextField!
    
    @IBOutlet weak var EnterGender_txt: UITextField!
    
    @IBOutlet weak var EnterCountryCity_txt: UITextField!
    
    @IBOutlet weak var id_txt: UITextField!
    
    @IBOutlet weak var bike_tbView: UITableView!
    
    @IBOutlet weak var edit_btn: UIButton!
    
    var isEditMode = false
    var imgUrl = String()
    
    var bikeList : [BikeModel]!
    var profiledata : ProfileGet!
    var isAPICalled = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProfile(id: 12)
        getBikeList()
        self.bike_tbView.delegate = self
        self.bike_tbView.dataSource = self
        EnterName_txt.text = UserName()
        EnterEmail_txt.text = UserEmail()
        EnterMobileNumber_txt.text = UserMobile()
        UserNamelbl.text = UserName()
        id_txt.text = UserId()
        
    }

    @IBAction func EditBtn(_ sender: Any) {
        postProfileDetails()
    }
    
    @IBAction func back_btn(_ sender: Any) {
        ScreensManager.shared.Dashboard(on: self,modal: true,animated: false)
    }
    
    @IBAction func changeProfile_Btn(_ sender: Any) {
       // changeProfileUrl()
        let alert = CommonAlertServices.shared.SingleImageUpload()
        alert.delegate = self
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func AddBike_btn(_ sender: Any) {
        ScreensManager.shared.BikeView(on: self,modal: true, animated: false)
        
    }
    
    
    func editMode(Profile : ProfileGet){
        if let dob = Profile.dob{
            EnterDOB_txt.text = dob
        }
        
        if let gender = Profile.gender{
            EnterGender_txt.text = gender
        }
        
        if let cnty = Profile.country{
            EnterCountryCity_txt.text = cnty
        }
        
        if let url = Profile.profileurl{
            ProfileImg.image = APIManager.sharedInstance.loadimage(url: url)
        }
        
        
        
        if Utils.unWrapInt(int: Profile.isEdit) == 0{
            EnterDOB_txt.isEnabled = true
            EnterGender_txt.isEnabled = true
            EnterCountryCity_txt.isEnabled = true
        }else{
            edit_btn.isHidden = true
            EnterDOB_txt.isEnabled = false
            EnterGender_txt.isEnabled = false
            EnterCountryCity_txt.isEnabled = false
        }
    }
    
}


extension ProfileViewController : getImageUrl{
    func delegate(str: String, img: UIImage) {
        ProfileImg.image = img
        imgUrl = str
        changeProfileUrl(urlStr: imgUrl)
    }
}

extension ProfileViewController{
    func getBikeList() {
        
        let url1 = bikeRegisterUrl + "/\(UserMobile())"
        APIManager.sharedInstance.requestGET(url1, success: { (response) in
            
            do {
                let throwables = try JSONDecoder().decode([BikeModel].self, from: response.rawData())
                print(throwables)
                self.isAPICalled = true
                self.bikeList = throwables
                self.bike_tbView.reloadData()
            } catch let jsonErr {
                print(jsonErr)
                self.presentAlert("JSON Error Occured", jsonErr.localizedDescription)
            }
            
        }) { (err) in
            self.presentAlert("Error Occurred", err.localizedDescription)
        }
    }
    
    func getProfile(id : Int) {
        
        let url1 = getProfileUrl + "\(18)"
        APIManager.sharedInstance.requestGET(url1, success: { (response) in
            
            do {
                let throwables = try JSONDecoder().decode(ProfileGet.self, from: response.rawData())
                print(throwables)
                self.profiledata = throwables
                self.editMode(Profile: throwables)
            } catch let jsonErr {
                print(jsonErr)
                self.presentAlert("JSON Error Occured", jsonErr.localizedDescription)
            }
            
        }) { (err) in
            self.presentAlert("Error Occurred", err.localizedDescription)
        }
    }
    
    func postProfileDetails(){
        let Para : Parameters = [
              "profileId": 18,
              "userId": 18,
              "profileurl": imgUrl,
              "name": UserName(),
              "email": UserEmail(),
              "mobileNumber": UserMobile(),
              "dob": Utils.unWrapString(string: EnterDOB_txt.text),
              "gender": Utils.unWrapString(string: EnterGender_txt.text),
              "country": Utils.unWrapString(string: EnterCountryCity_txt.text),
              "myrideid": 18
        ]
        postRewuest(Para)
    }
    
    func postRewuest(_ request: Parameters) {
        let url = PostProfileUrl
        APIManager.sharedInstance.requestPOST(url, params: request, success: { (response) in
            self.endloader()
            self.getProfile(id: Int(self.UserId()) ?? 0)
            self.showPop(text: "Profile Updated, Now you can't change profile")
        }) { (err) in
            self.showPop(text: "Error Occur")
        }
    }
    
    func changeProfileUrl(urlStr : String) {
        let url = PostProfileUrl + "\(18)?profileurl=\(urlStr)"
        
        APIManager.sharedInstance.requestPUT(url, success: { (response) in
            self.endloader()
            self.getProfile(id: Int(self.UserId()) ?? 0)
            self.showPop(text: "Profile Updated, Now you can't change profile")
        }) { (err) in
            self.showPop(text: "Error Occur")
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAPICalled == true{
            return bikeList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeCellTableViewCell", for: indexPath) as! BikeCellTableViewCell
        cell.setterObj = bikeList[indexPath.row]
        return cell
    }
    
    
}
