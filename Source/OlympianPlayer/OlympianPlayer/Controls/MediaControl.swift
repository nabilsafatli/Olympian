//
//  MediaPlayer.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-19.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

class MediaControl: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        guard let frame = superview?.frame else { return }

        self.frame = frame
        let playButton = PlayButton()
        addSubview(playButton)
        playButton.setupView()
    }
}
