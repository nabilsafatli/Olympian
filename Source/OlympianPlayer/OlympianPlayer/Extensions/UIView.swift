//
//  UIView.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-21.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

extension UIView {
    func setBackgroundImage(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage.from(name: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: image)
    }
}
