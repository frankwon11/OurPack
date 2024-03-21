//
//  OurPackView.swift
//  OurPack
//
//  Created by sseungwonnn on 3/20/24.
//

import SwiftUI

struct CurrentPackView: View {
    @ObservedObject var navigationManager: NavigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack (path: $navigationManager.currentPackViewPath){
            List {
                // 여행 멤버
                Section {
                    HStack {
                        // 본인
                        memberProfile(user: USER)
                        
                        // 여행 메이트
                        ForEach(FRIENDS) { friend in
                            Divider()
                            memberProfile(user: friend)
                        }
                    } // HStack
                } // Section
                .padding([.top, .bottom], 5)
            } // List
            .navigationTitle("니짐내짐")
        }
    }
}

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
