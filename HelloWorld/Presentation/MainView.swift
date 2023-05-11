//
//  MainView.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/05.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("로티 애니메이션")) {
          NavigationLink {
            LottieCollectionView()
          } label: {
            Text("Lottie Collection")
          }
        }
        
        Section(header: Text("우리가 용량 줄인거")) {
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/test_l.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4 @2x 190Kb")
          } label: {
            Text("애니메이션 - mp4 @2x 190Kb")
          }
          
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/test_m.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4 @2x 374Kb")
          } label: {
            Text("애니메이션 - mp4 @2x 374Kb")
          }
          
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/test_h.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4 @2x 3.4MB")
          } label: {
            Text("애니메이션 - mp4 @2x 3.4MB")
          }
        }
        
        Section(header: Text("배지 상세 애니메이션 loading Test")) {
//          NavigationLink {
//            WebPTestView()
//              .navigationTitle("애니메이션 - webp")
//          } label: {
//            Text("애니메이션 - webp")
//          }
//
//          NavigationLink {
//            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/badge1.mov")!
//            VideoTestView(videoURL: videoURL)
//              .navigationTitle("애니메이션 - mov")
//          } label: {
//            Text("애니메이션 - mov")
//          }
//
//          NavigationLink {
//            let videoURL = URL(string: "https://trailers.apple.com/movies/lucasfilm/indiana-jones-and-the-dial-of-destiny/indiana-jones-and-the-dial-of-destiny-trailer-1_h720p.mov")!
//            VideoTestView(videoURL: videoURL)
//              .navigationTitle("애니메이션 - mov Long")
//          } label: {
//            Text("애니메이션 - mov Long")
//          }
          
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/badge1.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4")
          } label: {
            Text("애니메이션 - mp4 low size")
          }
          
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/%401x.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4 @1x 2.3MB")
          } label: {
            Text("애니메이션 - mp4 @1x 2.3MB")
          }
          
          NavigationLink {
            let videoURL = URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/%402x.mp4")!
            VideoTestView(videoURL: videoURL)
              .navigationTitle("애니메이션 - mp4 @2x 3.4MB")
          } label: {
            Text("애니메이션 - mp4 @2x 3.4MB")
          }
          
//          NavigationLink {
//            let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")!
//            VideoTestView(videoURL: videoURL)
//              .navigationTitle("애니메이션 - m3u8")
//          } label: {
//            Text("애니메이션 - m3u8")
//          }
//
//          NavigationLink {
//            UIViewControllerAdaptor<WebmTestViewController>()
//              .navigationTitle("애니메이션 - webm")
//          } label: {
//            Text("애니메이션 - webm")
//          }
        }
      }
      .navigationTitle("UI&UX Lab.")
    }
    .navigationViewStyle(.stack)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
