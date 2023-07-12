//
//  GroupsCell.swift
//  MyRide
//
//  Created by Keval Shah on 21/02/23.
//

import UIKit

class GroupsCell: UITableViewCell {
    
    let Mainview: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.coolBackground.cgColor
        view.layer.cornerRadius = 1.0
        view.clipsToBounds = true
        return view
    }()
    
    lazy var GImg: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let GName: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    let GLastMessage: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 2
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    let GLastTime: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    var setterObj: GroupsModel? {
        
        didSet {
            if let GroupImg1 = setterObj?.groupImg, !GroupImg1.isEmpty {
                let dataDecoded:NSData = NSData(base64Encoded: GroupImg1, options: NSData.Base64DecodingOptions(rawValue: 0))!
                let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
                GImg.image = decodedimage
            } else {
                GImg.image = UIImage(named: "1.jpeg")
            }
            
            if let Groupname = setterObj?.gorupName, !Groupname.isEmpty {
                GName.text = Groupname
            } else {
                GName.text = "My Ride"
            }
            
            if let GroupLastTime1 = setterObj?.groupLastSeen, !GroupLastTime1.isEmpty {
                GLastTime.text = GroupLastTime1
            } else {
                GLastTime.text = "00:00AM"
            }
            
            if let GroupDiscription1 = setterObj?.groupLastMessage, !GroupDiscription1.isEmpty {
                GLastMessage.text = GroupDiscription1
            } else {
                GLastMessage.text = "Nothing"
            }
            
//            if let isNew = setterObj?.isNewMessage{
//                if isNew == true{
//                    GName.textColor = .red
//                    if let Groupname = setterObj?.groupName, !Groupname.isEmpty {
//                        GName.text = Groupname + " (\(Utils.unWrapString(string: setterObj?.newMessageCount)))"
//                    }
//                }else{
//                    GName.textColor = .black
//                }
//            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(Mainview)
        Mainview.addSubview(GName)
        Mainview.addSubview(GImg)
        Mainview.addSubview(GLastTime)
        Mainview.addSubview(GLastMessage)
        Mainview.cardView()
        GImg.layer.cornerRadius = 37

    }
    
    func setupAutoLayout() {
        
        Mainview.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        Mainview.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        Mainview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        Mainview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        Mainview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        GImg.leftAnchor.constraint(equalTo: Mainview.leftAnchor, constant: 15).isActive = true
        GImg.centerYAnchor.constraint(equalTo: Mainview.centerYAnchor).isActive = true
        GImg.heightAnchor.constraint(equalToConstant: 75).isActive = true
        GImg.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        GName.leftAnchor.constraint(equalTo: GImg.rightAnchor, constant: 10).isActive = true
        GName.topAnchor.constraint(equalTo: Mainview.topAnchor, constant: 10).isActive = true
        GName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        GLastTime.leftAnchor.constraint(equalTo: GName.rightAnchor, constant: 5).isActive = true
        GLastTime.rightAnchor.constraint(equalTo: Mainview.rightAnchor, constant: -10).isActive = true
        GLastTime.topAnchor.constraint(equalTo: Mainview.topAnchor, constant: 10).isActive = true
        GLastTime.heightAnchor.constraint(equalToConstant: 30).isActive = true
        GLastTime.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //
        GLastMessage.leftAnchor.constraint(equalTo: GImg.rightAnchor, constant: 10).isActive = true
        GLastMessage.rightAnchor.constraint(equalTo: Mainview.rightAnchor, constant: -10).isActive = true
        GLastMessage.topAnchor.constraint(equalTo: GName.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
}
