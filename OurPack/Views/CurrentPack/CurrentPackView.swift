//
//  OurPackView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/20/24.
//

import SwiftUI

struct CurrentPackView: View {
    @ObservedObject var navigationManager: NavigationManager = NavigationManager()
    
    @State var travelMates = FRIENDS
    
    @State var luggageItems = [
       LuggageItem(name: "헤어 드라이기"),
       LuggageItem(name: "샴푸"),
       LuggageItem(name: "치약"),
       LuggageItem(name: "옷"),
       LuggageItem(name: "고데기"),
       LuggageItem(name: "헤어 드라이기"),
       LuggageItem(name: "샴푸"),
       LuggageItem(name: "치약"),
       LuggageItem(name: "옷"),
       LuggageItem(name: "고데기")
   ]
    
    var body: some View {
        NavigationStack (path: $navigationManager.currentPackViewPath){
                List {
                    // 여행 멤버 섹션
                    Section (header: Text("여행 멤버").font(.subheadline).bold().foregroundStyle(.gray)) {
                        ScrollView(.horizontal){
                            HStack {
                                // 본인
                                memberProfile(user: USER)
                                
                                // 여행 메이트
                                ForEach(travelMates) { travelMate in
                                    Divider()
                                    memberProfile(user: travelMate)
                                }
                                
                                // 친구 초대
                                if travelMates.count < 4 {
                                    Divider()
                                    
                                    Button(action: {
                                        travelMates.append(HAZEL)
                                        travelMates.append(NOW)
                                    }, label: {
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .foregroundStyle(.teal)
                                            .frame(width: 40, height: 40)
                                            
                                    }).padding()
                                }
                            } // HStack
                        }
                    } // Section
                    .padding([.top, .bottom], 5)
                    
                    // 공유되는 짐 섹션
                    Section (header: Text("공유 중인 짐").font(.subheadline).bold().foregroundStyle(.gray)) {
                        // 짐 목록을 나타내는 그리드 뷰
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach(luggageItems) { item in
                                LuggageCardView(luggageItem: item)
                            }
                        }
                    }
                    
                    // 배정 버튼
                    Button(action: {
                    }) {
                        HStack {
                            Spacer()
                            Text("공유짐 배정하기")
                                .bold()
                            Spacer()
                        }
                        .padding()
                        .background(.teal)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                } // List
                .navigationTitle("이번 여행짐")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: Text("Hi")) {
                            Image(systemName: "person.fill")
                                .bold()
                                .foregroundStyle(.teal)
                            }
                        }
                    } // toolbar
        } // NavigationStack
    }
}

// 이번 여행 멤버 뷰
@ViewBuilder
func memberProfile(user: UserData) -> some View {
    VStack {
        Image(systemName: "person.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .padding([.top, .leading, .trailing], 15)
            .background(user.color.opacity(0.7))
            .foregroundStyle(.white)
            .clipShape(Circle())
        
        Text(user.name).font(.caption.bold())
    } // VStack
}
#Preview {
    CurrentPackView()
}
