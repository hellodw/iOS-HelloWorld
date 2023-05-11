//
//  WebPTestView.swift
//  HelloWorld
//
//  Created by Dongwon Lee on 2022/12/02.
//

import SwiftUI
//import SDWebImageWebPCoder
import SDWebImageSwiftUI

struct WebPTestView: View {
  var body: some View {
    //    WebPAdaptor()
    //      .frame(width: 100, height: 100)
    
    AnimatedImage(url: URL(string: "https://collectiond-weversedev-io.s3.ap-northeast-2.amazonaws.com/img/02.webp")!)
      .resizable()
      .frame(width: 280, height: 450)
      .background(Color.pink)
      .cornerRadius(20)
      
      
      
  }
  
  init() {
//    let WebPCoder = SDImageWebPCoder.shared
//    SDImageCodersManager.shared.addCoder(WebPCoder)
    SDImageCodersManager.shared.addCoder(SDImageAWebPCoder.shared)
  }
}

struct WebPTestView_Previews: PreviewProvider {
  static var previews: some View {
    WebPTestView()
  }
}



//struct WebPAdaptor: UIViewRepresentable {
//  func makeUIView(context: Context) -> UIImageView {
//    let webpURL = URL(string: "https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fbaabcf9-9bf9-457f-a538-729443f76f9d/02.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221202%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221202T090657Z&X-Amz-Expires=86400&X-Amz-Signature=5ddcd8160a483f55d0c15bbfde1727f22bb08fdcf00825fc34e2cc28635bc101&X-Amz-SignedHeaders=host&x-id=GetObject")!
//
//    let webpImageView = SDAnimatedImageView(frame: .zero)
//    webpImageView.shouldIncrementalLoad = true
//    webpImageView.sd_setImage(with: webpURL, placeholderImage: nil, options: [.progressiveLoad])
//    webpImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//    webpImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//
//    return webpImageView
//  }
//
//  func updateUIView(_ uiView: UIImageView, context: Context) {
//  }
//}
