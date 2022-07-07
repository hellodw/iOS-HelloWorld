//
//  UIKitAdaptor.swift
//  HelloWorld
//
//  Created by maverick.b on 2022/07/06.
//

import SwiftUI

struct UIViewControllerAdaptor<T: UIViewController>: UIViewControllerRepresentable {
    typealias UIViewControllerType = T
    
    func makeUIViewController(context: Context) -> T {
        T()
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) {
    }
}

struct UIViewAdaptor<T: UIView>: UIViewRepresentable {
    typealias UIViewType = T
    
    func makeUIView(context: Context) -> T {
        T(frame: .zero)
    }
    
    func updateUIView(_ uiView: T, context: Context) {
    }
}
