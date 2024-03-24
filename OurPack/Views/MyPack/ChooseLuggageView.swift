//
//  ChooseLuggageView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/24/24.
//

import SwiftUI

struct ChooseLuggageView: View {
    @Binding var myLuggages: [LuggageItem]
    let allLuggages = [
        "여권", "지갑", "보조 배터리", "볼펜", "목베개", "옷", "속옷",
        "양말", "잠옷", "신발", "모자", "상비약", "화장품", "어댑터",
        "우산", "헤어 드라이기", "고데기", "지퍼백", "삼각대", "셀카봉",
        "물티슈", "샤워기 필터", "세탁 세제", "스킨 로션", "자외선차단제",
        "폼클렌징", "칫솔", "치약", "가글", "샴푸", "린스", "바디로션",
        "인공눈물", "머리끈", "빗", "수건", "면도기", "수영복",
        "방수팩", "선글라스", "목도리", "방한용품"
    ]
    
    // "챙길 짐" 목록을 구성
    private var toPackLuggages: [String] {
        myLuggages.map { $0.name }
    }
    
    // "안 챙길 짐" 목록을 구성
    private var notToPackLuggages: [String] {
        allLuggages.filter { !toPackLuggages.contains($0) }
    }
    

    var body: some View {
        List {
            Section {
                HStack {
                    Button("이전 짐 가져오기") {}
                    .padding()
                    .background(.teal)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()

                    Button("추천 짐 가져오기") {}
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            
            Section(header: Text("챙길 짐")) {
                ForEach(toPackLuggages, id: \.self) { luggageName in
                    luggageRow(luggageName: luggageName, isInToPack: true)
                }
            }
            
            Section(header: Text("안 챙길 짐")) {
                ForEach(notToPackLuggages, id: \.self) { luggageName in
                    luggageRow(luggageName: luggageName, isInToPack: false)
                }
            }

        }
        .navigationBarTitle("챙길 짐 고르기", displayMode: .inline)
    }
    
    @ViewBuilder
    private func luggageRow(luggageName: String, isInToPack: Bool) -> some View {
        HStack {
            Text(luggageName)
            Spacer()
            Button(action: {
                if isInToPack {
                    myLuggages.removeAll { $0.name == luggageName }
                } else {
                    let newItem = LuggageItem(name: luggageName)
                    myLuggages.append(newItem)
                }
            }) {
                Image(systemName: isInToPack ? "minus" : "plus")
                    .foregroundStyle(.teal)
            }
        }
    }
    
}



#Preview {
    ChooseLuggageView(myLuggages: .constant([LuggageItem(name: "헤어 드라이기", isPacked: false)]))
}
