//
//  ViewController.swift
//  OlympianPlayer-Example
//
//  Created by Nabil Safatli on 2019-05-12.
//  Copyright © 2019 Olympian. All rights reserved.
//

import UIKit
import OlympianPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bigBuckBunny = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        guard let url = URL(string: bigBuckBunny) else { return }
        _ = OlympianPlayer(with: self, url: url)
    }

}
