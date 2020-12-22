//
//  ViewController.swift
//  CATransformLayer
//
//  Created by Bourbon on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {
    var transformLayer : CATransformLayer!
    var angle : CGFloat = 0
    var XPanOffset : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        transformLayer = CATransformLayer()
        transformLayer.frame = view.bounds
        view.layer.addSublayer(transformLayer)
        
        angle = 0
        XPanOffset = 0
        
        addPlane()
        addPlane()
        addPlane()
        addPlane()
        addPlane()
        
        animate()
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(pan(_:))))
    }


    func addPlane() -> Void {
        let planeSize = CGSize(width: 250, height: 150)
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: transformLayer.frame.width / 2 - planeSize.width / 2, y: 320 - planeSize.height / 2 - 20, width: planeSize.width, height: planeSize.height)
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.borderColor = UIColor(white: 1, alpha: 0.3).cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 4
        layer.colors = [UIColor.purple.cgColor, UIColor.red.cgColor]
        layer.locations = [0,1]
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 20
        layer.isDoubleSided = true
        transformLayer.addSublayer(layer)
    }
    
    func animate() -> Void {
        let degForPlane : CGFloat = 360.0 / CGFloat(transformLayer.sublayers!.count)
        var degX = angle
        transformLayer.sublayers?.forEach({ (layer) in
            var t = CATransform3DIdentity
            t.m34 = -1.0 / 1000.0
            t = CATransform3DRotate(t, degX / 180.0 * CGFloat.pi, 0, 1, 0)
            t = CATransform3DTranslate(t, 0, 0, 250)
            CATransaction.setAnimationDuration(0)
            layer.transform = t
            degX = degX + degForPlane
        })
    }
    
    @objc func pan(_ gesture : UIPanGestureRecognizer) -> Void {
        let xOffset = gesture.translation(in: view).x
        if gesture.state == .began {
            XPanOffset = 0
        }
        let movedBy = xOffset * 0.5 - XPanOffset
        XPanOffset += movedBy
        angle += movedBy
        animate()
    }
}

