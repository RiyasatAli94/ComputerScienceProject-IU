//
//  SideMenuView.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import Foundation
import UIKit

class SideMenuView : UITableViewCell{
 
    
    let titleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 16.5, weight: .semibold)
        lbl.textAlignment = .justified
        lbl.numberOfLines = 0
        lbl.backgroundColor = .white
        return lbl
    }()
    
    let viewLine: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupViews()
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(titleLbl)
        addSubview(viewLine)
    }
    
    func setupAutoLayout() {
        titleLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        viewLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        viewLine.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        viewLine.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 0).isActive = true
        viewLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        viewLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}


class SideMenuViewHeader : UITableViewHeaderFooterView{

    
    let titleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.font = UIFont.systemFont(ofSize: 16.5, weight: .bold)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .headerbarcolor
        return lbl
    }()
    
    //
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupAutoLayout()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        contentView.backgroundColor = UIColor.white
        addSubview(titleLbl)
        
    }
    
    
    func setupAutoLayout() {
        
        titleLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
}
