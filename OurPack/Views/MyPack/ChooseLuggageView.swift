//
//  ChooseLuggageView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/24/24.
//

import SwiftUI

struct ChooseLuggageView: View {
    @Binding var myLuggages: [LuggageItem]
    
    
    // "챙길 짐" 목록을 구성
    private var toPackLuggages: [String] {
        myLuggages.map { $0.name }
    }
    
    // "안 챙길 짐" 목록을 구성
    private var notToPackLuggages: [String] {
        LUGGAGES.filter { !toPackLuggages.contains($0) }
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
                    .buttonStyle(PlainButtonStyle()) // 버튼 클릭 효과 제거
                    .shadow(color: .gray, radius: 3, x: 0, y: 2) // 그림자
                    
                    Spacer()

                    Button("추천 짐 가져오기") {}
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .buttonStyle(PlainButtonStyle()) // 버튼 클릭 효과 제거
                    .shadow(color: .gray, radius: 3, x: 0, y: 2) // 그림자
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

        } // List
        .navigationBarTitle("챙길 짐 고르기", displayMode: .inline)
//        .listStyle(.plain)
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
