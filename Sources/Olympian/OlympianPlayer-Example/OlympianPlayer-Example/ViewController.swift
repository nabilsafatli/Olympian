//
//  ViewController.swift
//  OlympianPlayer-Example
//
//  Created by Nabil Safatli on 2019-05-12.
//  Copyright © 2019 Olympian. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit
//import OlympianPlayer

class ViewController: UIViewController {
    var playPauseButton: PlayPauseButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }

        let player = AVPlayer(url: url)
        player.rate = 1 //auto play
        let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false

        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)

        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        view.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        playPauseButton.updateUI()
    }
}

class PlayPauseButton: UIView {
    var kvoRateContext = 0
    var avPlayer: AVPlayer?
    var isPlaying: Bool {
        return avPlayer?.rate != 0 && avPlayer?.error == nil
    }

    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &kvoRateContext)
    }

    func setup(in container: UIViewController) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)

        updatePosition()
        updateUI()
        addObservers()
    }

    @objc func tapped(_ sender: UITapGestureRecognizer) {
        updateStatus()
        updateUI()
    }

    private func updateStatus() {
        if isPlaying {
            avPlayer?.pause()
        } else {
            avPlayer?.play()
        }
    }

    func updateUI() {
        if isPlaying {
            setBackgroundImage(name: "pause-button")
        } else {
            setBackgroundImage(name: "play-button")
        }
    }
    
    func updatePosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }

    private func setBackgroundImage(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage(named: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: image)
    }

    private func handleRateChanged() {
        updateUI()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let context = context else { return }

        switch context {
        case &kvoRateContext:
            handleRateChanged()
        default:
            break
        }
    }
}
