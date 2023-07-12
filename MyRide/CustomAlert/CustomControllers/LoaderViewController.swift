//
//  LoaderViewController.swift
//  MyRide
//
//  Created by Keval Shah on 09/03/23.
//

import UIKit

class LoaderViewController: UIViewController {

    @IBOutlet weak var loaderView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jeremyGif = UIImage.gifImageWithName("motorcycleloaderbg")
        let imageView = UIImageView(image: jeremyGif)
        imageView.backgroundColor = .clear
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        loaderView.addSubview(imageView)
    }
}
