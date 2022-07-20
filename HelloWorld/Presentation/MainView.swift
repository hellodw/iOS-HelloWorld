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
                Section(header: Text("UI 테스트 - 손쉬운사용 > 버튼 모양 설정시 음영 처리")) {
                    NavigationLink {
                        UIViewControllerAdaptor<TestUIViewController>()
                    } label: {
                        Text("버튼이 있는 TableView")
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
