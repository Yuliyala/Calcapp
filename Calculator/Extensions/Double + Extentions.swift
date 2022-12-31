//
//  Double + Extentions.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/31/22.
//

import Foundation

extension Double {
    
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

