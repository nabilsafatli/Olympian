//
//  FullScreenButton.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-06-01.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

class FullScreenButton: UIView, MediaControlElement{
    var mediaControl: MediaControlling?
    var isFullScreen: Bool = false

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
        frame = CGRect(x: (superView.frame.size.width / 2) - 50,
                       y: (superView.frame.size.height / 2) - 50,
                       width: 30,
                       height: 30)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)

        refresh()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        isFullScreen = !isFullScreen
        refresh()
    }

    func refresh() {
        guard isFullScreen else {
            setBackgroundImage(name: "fullscreen-plus")
            return
        }
        setBackgroundImage(name: "fullscreen-less")
    }
}
