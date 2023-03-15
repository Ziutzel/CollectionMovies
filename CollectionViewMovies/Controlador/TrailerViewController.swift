//
//  TrailerViewController.swift
//  CollectionViewMovies
//
//  Created by Ziutzel grajales on 08/12/22.
//

import UIKit
import youtube_ios_player_helper

class TrailerViewController: UIViewController , YTPlayerViewDelegate {
    
    var recibirUrlTrailer: String = ""
    
    @IBOutlet weak var videoTrailer: YTPlayerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoTrailer.load(withVideoId: "\(String(describing: recibirUrlTrailer))")
        videoTrailer.delegate = self
        //videoTrailer.load(withVideoId: recibirUrlTrailer)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        self.videoTrailer.playVideo()
    }
    
}
