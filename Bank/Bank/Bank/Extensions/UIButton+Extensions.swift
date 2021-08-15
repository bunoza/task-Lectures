//
//  UIButton+Extensions.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

import UIKit

extension UIButton{
    func roundedButton(){

        self.clipsToBounds = true
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
}
