//
//  MediaPlayer.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-19.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation

class MediaControl: UIView, MediaControlling {
    var status: PlayerStatus = .none
    var player: OlympianPlayerProtocol?
    var elements = [MediaControlElement]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup() {
        guard let frame = superview?.frame else { return }

        self.frame = frame
        let playPauseButton = PlayPauseButton()
        playPauseButton.mediaControl = self
        elements.append(playPauseButton)
        addSubview(playPauseButton)
        playPauseButton.setupView()
    }

    func play() {
        status = .playing
        player?.play()
        elements.forEach { $0.refresh() }
    }

    func pause() {
        status = .paused
        player?.pause()
        elements.forEach { $0.refresh() }
    }
}

protocol MediaControlling: UIView {
    var player: OlympianPlayerProtocol? { get set }
    var status: PlayerStatus { get set }

    func setup()
    func play()
    func pause()
}

enum PlayerStatus {
    case none
    case playing
    case paused
}

protocol MediaControlElement {
    func refresh()
}
