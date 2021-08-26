//
//  VideoManager.swift
//  Banoon
//
//  Created by bishoy on 26/11/2020.
//

import UIKit
import AVKit

extension UIViewController{
    
    func presentVideoPlayer(with url:String){
        guard let videoURL = URL(string: url)else{return}
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
}
