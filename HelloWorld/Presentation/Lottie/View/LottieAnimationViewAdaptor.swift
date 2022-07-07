//
//  LottieAnimationViewAdaptor.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/07.
//

import SwiftUI

struct LottieAnimationViewAdaptor: UIViewRepresentable {
    typealias UIViewType = LottieAnimationView
    
    private let lottieFileName: String
    
    init(lottieFileName: String) {
        self.lottieFileName = lottieFileName
    }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        return LottieAnimationView(lottieFileName: self.lottieFileName)
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}
