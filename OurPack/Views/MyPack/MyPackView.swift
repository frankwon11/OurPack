//
//  MyPack.swift
//  OurPack
//
//  Created by sseungwonnn on 3/20/24.
//

import SwiftUI

struct MyPackView: View {
    @State var myLuggages: [LuggageItem] = [
        .init(name: "여권"),
        .init(name: "지갑"),
        .init(name: "보조 배터리"),
        .init(name: "볼펜"),
        .init(name: "목베개"),
        .init(name: "옷"),
        .init(name: "속옷"),
        .init(name: "양말"),
        .init(name: "잠옷"),
        .init(name: "신발"),
        .init(name: "모자"),
        .init(name: "상비약"),
        .init(name: "화장품"),
        .init(name: "어댑터"),
        .init(name: "우산"),
        .init(name: "헤어 드라이기"),
        .init(name: "고데기"),
        .init(name: "지퍼백"),
        .init(name: "삼각대"),
        .init(name: "셀카봉"),
        .init(name: "물티슈"),
        .init(name: "샤워기 필터"),
        .init(name: "세탁 세제"),
        .init(name: "스킨 로션"),
        .init(name: "자외선차단제"),
        .init(name: "폼클렌징"),
        .init(name: "칫솔"),
        .init(name: "치약"),
        .init(name: "가글"),
        .init(name: "샴푸"),
        .init(name: "린스"),
        .init(name: "바디로션"),
        .init(name: "인공눈물"),
        .init(name: "머리끈"),
        .init(name: "빗"),
        .init(name: "수건"),
        .init(name: "면도기"),
        .init(name: "수영복"),
        .init(name: "방수팩"),
        .init(name: "선글라스"),
        .init(name: "목도리"),
        .init(name: "방한용품")
    ]
    
    private var sharedLuggages: [LuggageItem] {
        myLuggages.filter { $0.isShared }
    }
    
    private var privateLuggages: [LuggageItem] {
        myLuggages.filter { !$0.isShared && !$0.isPacked }
    }
    
    private var packedLuggages: [LuggageItem] {
        myLuggages.filter { !$0.isShared && $0.isPacked }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("같이 공유할 짐")) {
                    itemsGrid(luggages: $myLuggages.indices.filter { myLuggages[$0].isShared }.map { $myLuggages[$0] })
                }
                
                Section(header: Text("혼자 챙길 짐")) {
                    itemsGrid(luggages: $myLuggages.indices.filter { !myLuggages[$0].isShared && !myLuggages[$0].isPacked }.map { $myLuggages[$0] })
//                    itemsGrid(luggages: privateLuggages)
                }
                
                Section(header: Text("챙긴 짐")) {
                    itemsGrid(luggages: $myLuggages.indices.filter { !myLuggages[$0].isShared && myLuggages[$0].isPacked }.map { $myLuggages[$0] })
//                    itemsGrid(luggages: packedLuggages)
                }
            }
            .navigationTitle("짐 챙기기")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ChooseLuggageView(myLuggages: $myLuggages)) {
                        Image(systemName: "suitcase")
                            .bold()
                            .foregroundStyle(.teal)
                    }
                }
            }
        } // NavigationStack
    }
    
    @ViewBuilder
    private func itemsGrid(luggages: [Binding<LuggageItem>]) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(luggages.indices, id: \.self) { index in
                LuggageItemCardView(luggage: luggages[index]) {
                    luggages[index].wrappedValue.isShared.toggle()
                }
            }
        }
    }
//    @ViewBuilder
//    private func itemsGrid(luggages: [LuggageItem]) -> some View {
//        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//            ForEach(luggages) { luggage in
//                LuggageItemCardView(luggage: luggage) {
//                    // Toggle isShared status
//                    if let index = myLuggages.firstIndex(where: { $0.id == luggage.id }) {
//                        myLuggages[index].isShared.toggle()
//                    }
////                    guard let index = myLuggages.firstIndex(where: { $0.id == luggage.id }) else { return }
////                    myLuggages[index].isShared.toggle()
////                    if !myLuggages[index].isShared { // 공유를 취소했을 때는 자동으로 isPacked를 false로 설정
////                        myLuggages[index].isPacked = false
////                    }
//                }
//            }
//        }
//    }
    
}


#Preview {
    MyPackView()
}
