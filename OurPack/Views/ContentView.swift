//
//  ContentView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/20/24.
//

import SwiftUI

enum Tab {
    case myPack
    case ourPack
    case yourPack
}
struct ContentView: View {
    var body: some View {
        TabView {
            PackLibraryView()
                .tabItem {
                    Label("지난 여행짐", systemImage: "square.grid.2x2")
                }
                .tag(Tab.yourPack)
            CurrentPackView()
                .tabItem {
                    Label("이번 여행짐", systemImage: "person.3")
                }
                .tag(Tab.ourPack)
            MyPackView()
                .tabItem {
                    Label("내 짐 챙기기", systemImage: "gym.bag")
                }
                .tag(Tab.myPack)
        }
    }
}

#Preview {
    ContentView()
}
