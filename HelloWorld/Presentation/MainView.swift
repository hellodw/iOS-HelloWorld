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
                Section(header: Text("연구 2")) {
                    NavigationLink {
                        LottieCollectionView()
                    } label: {
                        Text("Lottie Collection")
                    }
                }
                Section(header: Text("연구 3")) {
                    NavigationLink {
                        LottieCollectionView()
                    } label: {
                        Text("Lottie Collection")
                    }
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
