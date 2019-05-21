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
    
    func setupView() {
        
        guard let superView = superview else { return }
        center = superView.convert(superView.center, from:superView)
        frame = CGRect(x: (superView.frame.size.width  / 2.0) - 50,
                       y: (superView.frame.size.height  / 2.0) - 50,
                       width: 100,
                       height: 100)

        setBackgroundImage(name: "play_circle")
    }
}
