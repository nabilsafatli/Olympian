//
//  UIImage.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-19.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

extension UIImage {
    static func from(name: String) -> UIImage? {
        let bundleIdentifier = "com.olympian.OlympianPlayer"
        return UIImage(named: name, in: Bundle(identifier: bundleIdentifier), compatibleWith: nil)
    }
}
