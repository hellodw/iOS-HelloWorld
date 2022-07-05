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
                Text("UI 스니핏")
                Text("UI 테스트")
            }
            .navigationTitle("매버릭 UI 연구소")
        }
        .navigationViewStyle(.stack)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
