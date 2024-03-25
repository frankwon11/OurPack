//
//  YourPack.swift
//  OurPack
//
//  Created by sseungwonnn on 3/20/24.
//

import SwiftUI

struct PackLibraryView: View {
    @ObservedObject var navigationManager: NavigationManager = NavigationManager()


    var body: some View {
        NavigationStack (path: $navigationManager.packLibraryViewPath){
            ZStack {
                Color("CustomBackground").ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                    CardView(
                        date: "2021.02.01",
                        title: "외가 식구들이랑 도쿄 여행!",
                        backgroundColor: .red
                    )
                    CardView(
                        date: "2023.01.01",
                        title: "규원 기웅과 후쿠오카 ~.~",
                        backgroundColor: .purple
                    )
                    CardView(
                        date: "2024.08.26",
                        title: "서핑 !!!!!",
                        backgroundColor: .blue
                    )
                    CardView(
                        date: "2024.12.20",
                        title: "첫 호주 첫 혼여행!",
                        backgroundColor: .orange
                    )
                } // VStack
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: Text("Hi")) {
                            Image(systemName: "airplane.departure")
                                .bold()
                                .foregroundStyle(.teal)
                            }
                        }
                    }
                } // ScrollView
            }
        }
    }
}

struct CardView: View {
    var date: String
    var title: String
    var backgroundColor: Color

    @ObservedObject var navigationManager: NavigationManager = NavigationManager()
    
    var body: some View {
        NavigationLink(destination: Text("Hi")) {
            ZStack {
                Circle()
                    .frame(width: 160, height: 120)
                    .foregroundStyle(backgroundColor).opacity(0.8)
                    .padding(.bottom, 160.0)

                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color("CustomBackground"))
                    .padding(.bottom, 120.0)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(date)
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white.opacity(0.8))
                        
                        Spacer()
                        Text(title)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 140)
                    .padding(.vertical)
                    .navigationTitle(Text("짐 보관함"))
                    
                    
                    Spacer() // VStack을 왼쪽으로 밀기
                }
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100) // 모든 카드를 같은 높이로 설정합니다.
                .background(backgroundColor.opacity(0.8))
                .cornerRadius(20)
                .shadow(radius: 5)
            } // ZStack
        }
    }
}

#Preview {
    PackLibraryView()
}
