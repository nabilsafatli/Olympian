//
//  PlayButton.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-13.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

class PlayButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        guard let width = superview?.frame.size.width, let height = superview?.frame.size.height else { return }
        frame = CGRect(x: width  / 2.0, y: height  / 2.0, width: 300, height: 300)

        guard let image =  UIImage(named: "play_circle") else { return }
        backgroundColor = UIColor(patternImage: image)
    }
}
