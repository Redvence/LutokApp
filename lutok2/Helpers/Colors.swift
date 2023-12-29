//
//  Colors.swift
//  lutok2
//

import UIKit

enum Colors: String, CaseIterable, Codable, Equatable {
    case white = "#ffffff"
    case gray = "#F0F2F1"
    case black = "#212121"
    
    var uiColor: UIColor {
        return UIColor(rgb: self.rawValue)!
    }
    
}
