//
//  UIColor+Extension.swift
//  network-basic
//
//  Created by junehee on 6/3/24.
//

import UIKit

extension UIColor {
    // 랜덤 컬러
    static func random() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}
