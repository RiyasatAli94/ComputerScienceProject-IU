//
//  AllBaseClass.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 06/02/20.
//  Copyright © 2020 Irfan Ajmeri. All rights reserved.
//

import UIKit
import WebKit
//
// MARK:- NavigationController
//
class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.isEnabled = false
    }
}

//
// MARK:- FullScreenWKWebView for SafeAreaInsets like showing full screen in iPhone X, XR, XS, etc.
//
class FullScreenWKWebView: WKWebView {
    
    override var safeAreaInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

//
// MARK:- UIViewWithDashedLineBorder
//
class UIViewWithDashedLineBorder: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 2.5)
        
        UIColor.imageViewBackground.setFill()
        path.fill()
        
        UIColor.blueMd.setStroke()
        path.lineWidth = 2.5
        
        let dashPattern : [CGFloat] = [10, 4]
        path.setLineDash(dashPattern, count: 2, phase: 0)
        path.stroke()
    }
}

//
// MARK:- Arrow
//
enum Position {
    case left
    case down
    case right
    case up
}

class Arrow: UIView {
    
    var arrowColor: UIColor = UIColor(red:0.08, green:0.24, blue:0.57, alpha:0.6) // 153E92
    var position: Position = .down {
        
        didSet {
            switch position {
            case .left:
                self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                break
                
            case .down:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2)
                break
                
            case .right:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                break
                
            case .up:
                self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                break
            }
        }
    }
    
    init(origin: CGPoint, size: CGFloat, color: UIColor) {
        super.init(frame: CGRect(x: origin.x, y: origin.y, width: size, height: size))
        arrowColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        // Get size
        let size = self.layer.frame.width
        
        // Create path
        let bezierPath = UIBezierPath()
        
        // Draw points
        let qSize = size/4
        
        bezierPath.move(to: CGPoint(x: 0, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size, y: qSize))
        bezierPath.addLine(to: CGPoint(x: size/2, y: qSize*3))
        bezierPath.addLine(to: CGPoint(x: 0, y: qSize))
        bezierPath.close()
        
        // Mask to path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = arrowColor.cgColor
        if #available(iOS 12.0, *) {
            self.layer.addSublayer (shapeLayer)
        } else {
            self.layer.mask = shapeLayer
        }
    }
}

//
// MARK:- TitleLabelWithShadowView
//
final class TitleLabelWithShadowView: UIView {
    
    //
    let titleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 16.5, weight: .semibold)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAutoLayout()
    }
    
    func setupViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.navBar
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.0
        layer.shadowOffset = CGSize(width: 0.0, height: 1.5)
        addSubview(titleLbl)
    }
    
    func setupAutoLayout() {
        
        NSLayoutConstraint.activate(
            [
                titleLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
                titleLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
                titleLbl.topAnchor.constraint(equalTo: topAnchor),
                titleLbl.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
// MARK:- CommonObserveeView || Used In Report BBS Observation
//
final class CommonObserveeView: UIView {
    
    //
    let mainView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.cornerRadius = 2.5
        view.clipsToBounds = true
        return view
    }()
    
    let mainTitleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        lbl.textColor = .titleLabel
        lbl.font = .systemFont(ofSize: 16, weight: .light)
        return lbl
    }()
    
    let leftTitleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .titleLabel
        lbl.font = .systemFont(ofSize: 15)
        return lbl
    }()
    
    let leftTF: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .titleLabel
        tf.font = .systemFont(ofSize: 16.5, weight: .medium)
        return tf
    }()
    
    let rightTitleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .titleLabel
        lbl.font = .systemFont(ofSize: 15)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var rightTF: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .titleLabel
        tf.font = .systemFont(ofSize: 16.5, weight: .medium)
        tf.textAlignment = .right
        return tf
    }()
    
    //======================================================================//
    //
    // MARK:- init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAutoLayout()
    }
    
    func setupViews() {
        
        addSubview(mainView)
        addSubview(mainTitleLbl)
        mainView.addSubview(leftTitleLbl)
        mainView.addSubview(leftTF)
        mainView.addSubview(rightTitleLbl)
        mainView.addSubview(rightTF)
    }
    
    func setupAutoLayout() {
        
        mainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mainTitleLbl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainTitleLbl.centerYAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        mainTitleLbl.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        leftTitleLbl.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8).isActive = true
        leftTitleLbl.rightAnchor.constraint(equalTo: mainView.centerXAnchor, constant: -2).isActive = true
        leftTitleLbl.topAnchor.constraint(equalTo: mainTitleLbl.bottomAnchor, constant: 2).isActive = true
        leftTitleLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        leftTF.leftAnchor.constraint(equalTo: leftTitleLbl.leftAnchor).isActive = true
        leftTF.rightAnchor.constraint(equalTo: leftTitleLbl.rightAnchor).isActive = true
        leftTF.topAnchor.constraint(equalTo: leftTitleLbl.bottomAnchor).isActive = true
        leftTF.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        rightTitleLbl.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -8).isActive = true
        rightTitleLbl.leftAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 2).isActive = true
        rightTitleLbl.topAnchor.constraint(equalTo: mainTitleLbl.bottomAnchor, constant: 2).isActive = true
        rightTitleLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        rightTF.rightAnchor.constraint(equalTo: rightTitleLbl.rightAnchor).isActive = true
        rightTF.leftAnchor.constraint(equalTo: rightTitleLbl.leftAnchor).isActive = true
        rightTF.topAnchor.constraint(equalTo: rightTitleLbl.bottomAnchor).isActive = true
        rightTF.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
// MARK:- CommonSingleObserveeView || Used In Report BBS Observation
//
final class CommonSingleObserveeView: UIView {
    
    //
    let mainView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.cornerRadius = 2.5
        view.clipsToBounds = true
        return view
    }()
    
    let mainTitleLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        lbl.textColor = .titleLabel
        lbl.font = .systemFont(ofSize: 16, weight: .light)
        return lbl
    }()
    
    let textField: UITextField = {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .titleLabel
        tf.font = .systemFont(ofSize: 16.5, weight: .medium)
        tf.textAlignment = .center
        return tf
    }()
    
    //======================================================================//
    //
    // MARK:- init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAutoLayout()
    }
    
    func setupViews() {
        
        addSubview(mainView)
        addSubview(mainTitleLbl)
        mainView.addSubview(textField)
    }
    
    func setupAutoLayout() {
        
        mainView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mainTitleLbl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainTitleLbl.centerYAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        mainTitleLbl.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        textField.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 4).isActive = true
        textField.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -4).isActive = true
        textField.topAnchor.constraint(equalTo: mainTitleLbl.bottomAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
