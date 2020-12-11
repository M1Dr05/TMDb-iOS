//
//  Utils.swift
//  tmdb
//
//  Created by M1Dr05 on 2/12/20.
//

import Foundation
import UIKit

struct Utils {
    
    struct URL {
        static let baseUrl = Bundle.main.infoDictionary!["BASE_URL"] as! String
        static let urlTmdb = Bundle.main.infoDictionary!["URL_TMDB"] as! String
    }
    
    struct COLORS {
        
        static let colorPrimary = UIColor(hex: "#595959")
        static let colorPrimaryMedium = UIColor(hex: "#353535")
        static let colorPrimaryDark = UIColor(hex: "#252525")
        static let colorAccent = UIColor(hex: "#5f8e5a")
        
    }
    
}

extension UIColor {
    
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) { cString.removeFirst() }
        
        if ((cString.count) != 6) {
            self.init(hex: "ff0000")
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
