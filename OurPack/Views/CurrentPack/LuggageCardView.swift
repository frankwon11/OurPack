//
//  SwiftUIView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/22/24.
//

import SwiftUI
// 짐 목록 카드 뷰
struct LuggageCardView: View {
    var luggageItem: LuggageItem

    @State private var backgroundColorIndex = 0 // 배경색 인덱스
    private let backgroundColors: [Color] = [.gray, .blue, .red, .green] // 배경색 배열
    
    var body: some View {
        Button(action: {
            // 다음 색상으로 변경
            backgroundColorIndex = (backgroundColorIndex + 1) % backgroundColors.count
        }) {
            VStack(alignment: .leading) {
                HStack {
                    Circle().fill(Color.blue).frame(width: 12, height: 12)
                    Circle().fill(Color.red).frame(width: 12, height: 12)
                    Circle().fill(Color.green).frame(width: 12, height: 12)
                }
                Text(luggageItem.name)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 110, height: 30, alignment: .leading)
                    .padding()
                    .background(backgroundColors[backgroundColorIndex].opacity(0.6))
                    .cornerRadius(10) // 배경색상이 RoundedRectangle의 모서리 반경을 따라가도록 함
            }
            .padding()
        } // Button
        .buttonStyle(PlainButtonStyle()) // 버튼 클릭 효과 제거
        .shadow(color: .gray, radius: 3, x: 0, y: 2) // 그림자
    }
}



#Preview {
    LuggageCardView(luggageItem: LuggageItem(name: "헤어 드라이기"))
}
