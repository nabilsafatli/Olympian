//
//  OlympianPlayer.swift
//  OlympianPlayer
//
//  Created by Nabil Safatli on 2019-05-12.
//  Copyright © 2019 Olympian. All rights reserved.
//

import Foundation
import AVKit

public class OlympianPlayer {
    private var avPlayer: AVPlayer!
    private var playerViewController: AVPlayerViewController!
    var url: URL?
    
    public init(with container: UIViewController,
                url: URL? = nil,
                autoPlay: Bool? = false) {
        guard let url = url else { return }
        avPlayer = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        let playerFrame = CGRect(x: 0, y: 0, width: container.view.frame.width, height: container.view.frame.height)
        playerViewController.player = avPlayer
        
        if let autoPlay = autoPlay {
            avPlayer.rate = autoPlay ? 1 : 0
        }
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false
        
        container.addChild(playerViewController)
        container.view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: container)
        setupControls(in: container)
    }

    func setupControls(in container: UIViewController) {
        let mediaControl = MediaControl()
        container.view.addSubview(mediaControl)
        mediaControl.setupView()
    }
}
