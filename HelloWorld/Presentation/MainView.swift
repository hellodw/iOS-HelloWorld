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
                NavigationLink {
                    LottieCollectionView()
                } label: {
                    Text("Lottie Collection")
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
