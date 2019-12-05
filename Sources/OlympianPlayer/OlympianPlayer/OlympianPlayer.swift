//
//  OlympianPlayer.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-12.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation
import AVKit

protocol PlayerActions {
    func play()
    func pause()
}

protocol OlympianPlayerProtocol: PlayerActions {}

public class OlympianPlayer: OlympianPlayerProtocol {
    private var avPlayer: AVPlayer!
    private var playerViewController: AVPlayerViewController!
    private var mediaControl: MediaControlling!
    var url: URL?

    public init(with container: UIViewController,
                url: URL? = nil,
                autoPlay: Bool? = true) {
        guard let url = url else { return }
        avPlayer = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        let playerFrame = CGRect(x: 0, y: 0, width: container.view.frame.width, height: container.view.frame.height)
        playerViewController.player = avPlayer

        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false

        container.addChild(playerViewController)
        container.view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: container)
        setupControls(in: container)
        if let autoPlay = autoPlay, autoPlay {
            mediaControl.play()
        }
    }

    func setupControls(in container: UIViewController) {
        mediaControl = MediaControl()
        mediaControl.player = self
        container.view.addSubview(mediaControl)
        mediaControl.setup()
    }

    //MARK: - OlympianPlayerActions
    func play() {
        avPlayer.play()
    }

    func pause() {
        avPlayer.pause()
    }
}
