//
//  LuggageItemCardView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/23/24.
//

import SwiftUI

struct LuggageItemCardView: View {
    @Binding var luggage: LuggageItem
    var toggleShared: () -> Void
    
    var backgroundColor: Color {
        if luggage.isShared { // 공유 짐인 경우
            return .gray.opacity(0.3)
        } else { // 개인 짐인 경우
            if luggage.isPacked { // 이미 챙긴 경우
                // toggle
                return .gray.opacity(0.8)
            } else { // 아직 안 챙긴 경우
                // toggle
                return .teal
            }
        }
    }
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                Button(action: {
                    self.luggage.isPacked.toggle() // isPacked 상태를 토글합니다.
                } ) {
                    Text(luggage.name)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 110, height: 30, alignment: .leading)
                        .padding()
                        .background(backgroundColor)
                        .cornerRadius(10) // 배경색상이 RoundedRectangle의 모서리 반경을 따라가도록 함
                    .padding()
                } // Button
                .buttonStyle(PlainButtonStyle()) // 버튼 클릭 효과 제거
                .shadow(color: .gray, radius: 3, x: 0, y: 2) // 그림자
            } // VStack
            
            HStack() {
                Spacer()
                Button(action: self.toggleShared) {
                    Image(systemName: luggage.isShared ? "minus" : "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(luggage.isShared ? .red.opacity(0.8) : .green.opacity(0.8))
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                    
                } // Button
                .buttonStyle(PlainButtonStyle()) // 버튼 클릭 효과 제거
            } // HStack
            .frame(width: 120, height: 30)
        } // ZStack
    }
}

//#Preview {
//    LuggageItemCardView(luggage: Binding<Any><LuggageItem(name: "헤어 드라이기"), toggleShared: {})
//}
