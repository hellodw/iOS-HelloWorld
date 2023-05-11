//
//  LottieTestAnimationView.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/06.
//

import UIKit
import Lottie
import SnapKit

final class LottieTestAnimationView: UIView {
    private let animationView = LottieAnimationView()
    
    init(lottieFileName: String) {
        super.init(frame: .zero)
        
        self.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        animationView.animation = LottieAnimation.named(lottieFileName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
