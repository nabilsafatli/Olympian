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
    var url: URL?
    var autoPlay: Bool = false

    public init(with container: UIViewController, url: URL? = nil) {
        guard let url = url else { return }
        avPlayer = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        let playerFrame = CGRect(x: 0, y: 0, width: container.view.frame.width, height: container.view.frame.height)
        playerViewController.player = avPlayer
        avPlayer.rate = autoPlay ? 1 : 0
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false

        container.addChild(playerViewController)        
        container.view.addSubview(playerViewController.view)
        container.view.addSubview(PlayButton())
        playerViewController.didMove(toParent: container)
    }

    public func play() {
        avPlayer.rate = 1
    }
}
