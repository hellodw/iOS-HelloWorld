//
//  WebmTestViewController.swift
//  HelloWorld
//
//  Created by Dongwon Lee on 2022/12/05.
//

import UIKit
import AVFoundation
import MobileVLCKit
import MediaPlayer

final class WebmTestViewController: UIViewController, VLCMediaPlayerDelegate {
  
  var mediaPlayer = VLCMediaPlayer()
  let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/02.webm")!
  
  var movieView: UIView = {
    let view = UIView(frame: .zero)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    
    print("hello w")
    
    
    view.addSubview(movieView)
    movieView.translatesAutoresizingMaskIntoConstraints = false
    movieView.widthAnchor.constraint(equalToConstant: 280).isActive = true
    movieView.heightAnchor.constraint(equalToConstant: 498).isActive = true
    movieView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    movieView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true

    
    setupUI()
    
    
  }
  
  
  func setupUI() {
    do {
      try AVAudioSession.sharedInstance().setActive(true, options: AVAudioSession.SetActiveOptions.init())
    } catch {
      print("AVAudioSession set active failed: \(error)")
    }
    
   
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    setupMediaPLayer()
  }
  
  func setupMediaPLayer() {
    mediaPlayer.delegate = self
    mediaPlayer.drawable = movieView
    mediaPlayer.media = VLCMedia(url: videoURL)
//    mediaPlayer.addObserver(self, forKeyPath: "time", options: [], context: nil)
//    mediaPlayer.addObserver(self, forKeyPath: "remainingTime", options: [], context: nil)
    mediaPlayer.play()
    
//    if controlPanel.isHidden {
//      toggleControlsVisible()
//    }
//    resetIdleTimer()
  }
}

