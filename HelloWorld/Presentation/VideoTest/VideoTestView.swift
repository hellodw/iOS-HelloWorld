//
//  VideoTestView.swift
//  HelloWorld
//
//  Created by Dongwon Lee on 2022/12/05.
//

import AVKit
import SwiftUI

struct VideoTestView: View {
  
  let videoURL: URL
  @State private var isFlipped = false
  @State private var degree: Double = 0
  
  init(videoURL: URL) {
    self.videoURL = videoURL
  }
  
  var body: some View {
    makeFullScreenVideoPlayer(url: videoURL)
      .frame(width: 280, height: 498)
      .cornerRadius(20)
      .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
      .onTapGesture {
        flipCard()
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()
      }
  }
  
  @ViewBuilder
  private func makeFullScreenVideoPlayer(url: URL) -> some View {
    let avPlayer = AVPlayer(url: url)
//
//    VideoPlayer(player: avPlayer)
//      .edgesIgnoringSafeArea(.all)
//      .onAppear {
//        avPlayer.play()
//      }
    
    AVPlayerControllerAdaptor(player: avPlayer)
      .edgesIgnoringSafeArea(.all)
      .onAppear {
        avPlayer.play()
      }
  }
  
  private func flipCard() {
    withAnimation {
      degree = isFlipped ? 0 : -180
      isFlipped.toggle()
    }
    
    
    
    
    
  }
}

struct VideoTestView_Previews: PreviewProvider {
  static var previews: some View {
    let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/badge1.mov")!
    VideoTestView(videoURL: videoURL)
  }
}




struct AVPlayerControllerAdaptor : UIViewControllerRepresentable {
  var player : AVPlayer
  
  func makeUIViewController(context: Context) -> some AVPlayerViewController {
    let controller = AVPlayerViewController()
    controller.player = player
    controller.showsPlaybackControls = false
    
    if #available(iOS 16.0, *) {
      controller.allowsVideoFrameAnalysis = false
    }
    
//    controller.view.backgroundColor = .red
    
    return controller
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}
