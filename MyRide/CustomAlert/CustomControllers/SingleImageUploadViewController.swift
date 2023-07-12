//
//  SingleImageUploadViewController.swift
//  MyRide
//
//  Created by Keval Shah on 13/03/23.
//

import UIKit
import FMPhotoPicker

protocol getImageUrl{
    func delegate(str : String, img : UIImage)
}

class SingleImageUploadViewController: UIViewController {
    
    
    @IBOutlet weak var superView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var select_Btn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!
    var imagePicker = UIImagePickerController()
    var selectImg = UIImage()
    var selectPath: URL!
    var config = FMPhotoPickerConfig()
    var delegate : getImageUrl! = nil
    var editImg = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadBtn.isHidden = true
        superView.cardView()
    }

    @IBAction func selectBtnAction(_ sender: Any) {
        OpenImage()
    }
    
    @IBAction func editPhoto(_ sender: Any) {
        //OpenImage()
        let editor = FMImageEditorViewController(config: config, sourceImage: selectImg)
        editor.delegate = self
        self.present(editor, animated: true)
       
    }
    
    @IBAction func uploadBtnAction(_ sender: Any) {
        startloader()
        firebaseupload.shared.uploadFile(fileUrl: selectPath, fileName1: "\(UserMobile())"){ [weak self] success,imgurl in
            guard success else {
                self?.endloader()
                let alert = CommonAlertServices.shared.alertPresent(Text: "Please try again! Something is wrong")
                self?.present(alert, animated: true, completion: nil)
                return}
            self?.endloader()
            let url = imgurl
            self?.delegate.delegate(str: url, img: self?.selectImg ?? UIImage())
            print("Image URL :- \(url)")
            self?.dismiss(animated: false, completion: nil)
        }
    }
}

extension SingleImageUploadViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func OpenImage(){
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
          
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let backgroundImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        selectImg = backgroundImage
        selectPath = imagePath
        img.image = backgroundImage
        select_Btn.setTitle("Change", for: .normal)
        uploadBtn.isHidden = false
        if let jpegData = backgroundImage.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }

        print(backgroundImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


extension SingleImageUploadViewController: FMImageEditorViewControllerDelegate{
    func fmImageEditorViewController(_ editor: FMPhotoPicker.FMImageEditorViewController, didFinishEdittingPhotoWith photo: UIImage) {
        img.image = photo
        selectImg = photo
        editor.dismiss(animated: true)
    }
}
