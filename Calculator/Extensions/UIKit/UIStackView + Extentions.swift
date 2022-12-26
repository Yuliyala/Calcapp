//
//  UIStackView + Extentions.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/26/22.
//

import UIKit

extension UIStackView {
   
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
    
}
