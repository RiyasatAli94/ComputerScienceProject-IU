//
//  RideCell.swift
//  MyRide
//
//  Created by Keval Shah on 24/02/23.
//


import UIKit

class RideCell: UITableViewCell {
    
    let Mainview: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.coolBackground.cgColor
        view.layer.cornerRadius = 1.0
        view.clipsToBounds = true
        return view
    }()
    
    let HeaderView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .subHeaderBarColor
        //view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.coolBackground.cgColor
        view.layer.cornerRadius = 1.0
        view.clipsToBounds = true
        return view
    }()
    
    let RideName: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    let RideDate: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    
    let runningView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightBlueMd
        //view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.coolBackground.cgColor
        view.layer.cornerRadius = 1.0
        view.clipsToBounds = true
        return view
    }()
    
    let runninglbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    
    lazy var StartImg: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "end1")
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var EndRideImg: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "finish")
        iv.clipsToBounds = true
        return iv
    }()
    
    let StartName: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    let EndName: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl
    }()
    
    
    var setterObj: RideData? {

        didSet {
            

            if let Groupname = setterObj?.rideName, !Groupname.isEmpty {
                let startTime = Utils.unWrapString(string: setterObj?.startDate)
                RideName.attributedText = getCustomAttributedText(15, Groupname, "\n\(startTime)")
            } else {
                RideName.text = "My Ride"
            }
            
            if let date = setterObj?.startDate, !date.isEmpty {
               
                RideDate.attributedText = getCustomAttributedText(15, date, "")
            } else {
                RideDate.text = "My Ride"
            }

            if let GroupLastTime1 = setterObj?.startLocation, !GroupLastTime1.isEmpty {
                let EndtTime = Utils.unWrapString(string: setterObj?.startDate)
                let flagOff = Utils.unWrapString(string: setterObj?.meetingTime)
                StartName.attributedText = getCustomAttributedText(15, GroupLastTime1, "\n\(EndtTime)\n\(flagOff)")
            } else {
                StartName.text = "00:00AM"
            }

            if let GroupDiscription1 = setterObj?.endLocation, !GroupDiscription1.isEmpty {
                let EndtTime = Utils.unWrapString(string: setterObj?.endDate)
                let end = Utils.unWrapString(string: setterObj?.flagTime)
                EndName.attributedText = getCustomAttributedText(15, GroupDiscription1, "\n\(EndtTime)\n\(end)")
            } else {
                EndName.text = "Nothing"
            }
            
            let stat = Utils.unWrapString(string: setterObj?.startDate)
            let end = Utils.unWrapString(string: setterObj?.endDate)
            let startDate = Utils.stringTodate(stringDate: stat)
            let endDate = Utils.stringTodate(stringDate: end)
            let currentDate = Utils.currentDateInDate()
                
            if startDate < currentDate {
                runninglbl.text = "Complete Rides"
                if currentDate < endDate{
                    runninglbl.text = "Running Rides"
                }
            }
            if currentDate < startDate{
                runninglbl.text = "Upcoming Rides"
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
        Mainview.addSubview(HeaderView)
        HeaderView.addSubview(RideName)
        HeaderView.addSubview(RideDate)
        
        Mainview.addSubview(runningView)
        runningView.addSubview(runninglbl)
        
        Mainview.addSubview(StartImg)
        Mainview.addSubview(EndRideImg)
        Mainview.addSubview(StartName)
        Mainview.addSubview(EndRideImg)
        Mainview.addSubview(EndName)
        Mainview.cardView()
        StartImg.layer.cornerRadius = 25
        EndRideImg.layer.cornerRadius = 25

    }
    
    func setupAutoLayout() {
        
        Mainview.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        Mainview.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        Mainview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        Mainview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        Mainview.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        HeaderView.topAnchor.constraint(equalTo: Mainview.topAnchor).isActive = true
        HeaderView.rightAnchor.constraint(equalTo: Mainview.rightAnchor).isActive = true
        HeaderView.leftAnchor.constraint(equalTo: Mainview.leftAnchor).isActive = true
        HeaderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        RideName.leftAnchor.constraint(equalTo: HeaderView.leftAnchor, constant: 20).isActive = true
        RideName.centerYAnchor.constraint(equalTo: HeaderView.centerYAnchor).isActive = true
        
        RideDate.rightAnchor.constraint(equalTo: HeaderView.rightAnchor, constant: -10).isActive = true
        RideDate.centerYAnchor.constraint(equalTo: HeaderView.centerYAnchor).isActive = true
        //RideDate.leftAnchor.constraint(equalTo: RideName.rightAnchor, constant: 10).isActive = true
        //RideDate.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        runningView.topAnchor.constraint(equalTo: HeaderView.bottomAnchor).isActive = true
        runningView.rightAnchor.constraint(equalTo: Mainview.rightAnchor).isActive = true
        runningView.leftAnchor.constraint(equalTo: Mainview.leftAnchor).isActive = true
        runningView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        runninglbl.centerXAnchor.constraint(equalTo: runningView.centerXAnchor, constant: 20).isActive = true
        runninglbl.centerYAnchor.constraint(equalTo: runningView.centerYAnchor).isActive = true
        runninglbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        StartImg.leftAnchor.constraint(equalTo: Mainview.leftAnchor, constant: 30).isActive = true
        StartImg.topAnchor.constraint(equalTo: runningView.bottomAnchor, constant: 20).isActive = true
        StartImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        StartImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        EndRideImg.rightAnchor.constraint(equalTo: Mainview.rightAnchor, constant: -30).isActive = true
        EndRideImg.topAnchor.constraint(equalTo: runningView.bottomAnchor, constant: 20).isActive = true
        EndRideImg.heightAnchor.constraint(equalToConstant: 50).isActive = true
        EndRideImg.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        StartName.leftAnchor.constraint(equalTo: Mainview.leftAnchor, constant: 15).isActive = true
        StartName.topAnchor.constraint(equalTo: StartImg.bottomAnchor, constant: 10).isActive = true
        //StartName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        StartName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        EndName.rightAnchor.constraint(equalTo: Mainview.rightAnchor, constant: -15).isActive = true
        EndName.topAnchor.constraint(equalTo: EndRideImg.bottomAnchor, constant: 10).isActive = true
        //EndName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        EndName.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
}

