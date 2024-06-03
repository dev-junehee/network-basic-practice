//
//  ReuseableProtocol.swift
//  network-basic
//
//  Created by junehee on 6/3/24.
//

import UIKit

protocol ReuseableProtocol: AnyObject {
    static var identifier: String { get }
}

extension UITableViewCell: ReuseableProtocol {
    // 아래 세 가지는 다 똑같음!
    static var identifier: String {
        return String(describing: self)
    }
    
//    static var identifier: String {
//        String(describing: self)
//    }
//    
//    static var identifier: String {
//        get {
//            return String(describing: self)
//        }
//    }
    
}

extension UIViewController: ReuseableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
