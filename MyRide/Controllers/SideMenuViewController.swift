//
//  SideMenuViewController.swift
//  MyRide
//
//  Created by Keval Shah on 17/02/23.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var closeBtn : UIButton!
    @IBOutlet weak var tbView : UITableView!
    let List = ["Account":["Profile","Create Ride","Groups","Sign-Out"],
                "Ride":["Upcoming Rides","Completed Rides"]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewFunc()
        slideButton()

    }
    
    @IBAction func closeMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func slideButton(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.closeBtn.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
            case .down:
                print("Swiped down")
            case .left:
                dismiss(animated: true, completion: nil)
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}


