//
//  SearchBarViewController.swift
//  MyRide
//
//  Created by Keval Shah on 27/03/23.
//

import UIKit

protocol getBrandBike{
    func delegete(dataNmae : String, dataId : Int, tag : Int)
}

class SearchBarViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var searchbar_txt: UITextField!
    var DataModelName = [String]()
    var DataModelId = [Int]()
    @IBOutlet weak var tbView: UITableView!
    var filterData = [String]()
    var delegate : getBrandBike! = nil
    var tag = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        tbView.delegate = self
        tbView.dataSource = self
        searchbar_txt.delegate = self
    }
    
}


extension SearchBarViewController{
    func design(){
        searchbar_txt.rightViewMode = .always
        let imgView1 = UIImageView(image: UIImage(named: "search"))
        imgView1.frame = CGRect(x: -10, y: 9.5, width: 15, height: 15)
        imgView1.tintColor = .navBar
        searchbar_txt.rightView = imgView1
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
       
        for data in DataModelName{
            let str = Utils.unWrapString(string: data).uppercased()
            if str.contains(string.uppercased()){
                filterData.append(data)
                print(filterData)
            }
        }
        DataModelName.removeAll()
        DataModelName = filterData
        tbView.reloadData()

        // make sure the result is under 16 characters
        return currentText.count <= 16
    }
}

extension SearchBarViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModelName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "SearchBarTableViewCell", for: indexPath) as! SearchBarTableViewCell
        cell.namelbl.text = Utils.unWrapString(string: DataModelName[indexPath.row])
        if indexPath.row%2 == 0{
            cell.backgroundColor = .systemGray6
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataName = DataModelName[indexPath.row]
        let ddatId = DataModelId[indexPath.row]
        delegate.delegete(dataNmae: dataName, dataId: ddatId, tag: tag)
        dismiss(animated: true)
    }
    
}
