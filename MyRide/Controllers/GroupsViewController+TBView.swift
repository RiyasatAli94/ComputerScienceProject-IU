//
//  GroupsViewController+TBView.swift
//  MyRide
//
//  Created by Keval Shah on 26/04/23.
//

import Foundation
import UIKit

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataCount = messageModel{
            return dataCount.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
        cell.setterObj = messageModel?[indexPath.row]
        if Utils.unWrapString(string: messageModel?[indexPath.row].senderId) == UserId(){
            cell.messageView.backgroundColor = .lightGreenMd
            cell.senderName.backgroundColor = .lightGreenMd
            cell.senderName.layer.cornerRadius = 15
            cell.senderName.layer.masksToBounds = true
        }else{
            cell.messageView.backgroundColor = .lightGray
            cell.senderName.backgroundColor = .lightGray
            cell.senderName.layer.cornerRadius = 15
            cell.senderName.layer.masksToBounds = true
        }
        return cell
    }
    
    
}
