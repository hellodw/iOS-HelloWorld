//
//  LottieAnimationView.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/06.
//

import UIKit
import Lottie

final class LottieAnimationView: UIView {
    private let animationView = AnimationView()
    
    init(lottieFileName: String) {
        super.init(frame: .zero)
        
        self.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: self.topAnchor),
            animationView.rightAnchor.constraint(equalTo: self.rightAnchor),
            animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            animationView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
        
        animationView.animation = Animation.named(lottieFileName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
