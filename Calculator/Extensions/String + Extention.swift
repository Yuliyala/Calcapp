//
//  String + Extention.swift
//  Calculator
//
//  Created by Yuliya Lapenak on 12/31/22.
//

import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
