//
//  LuggageData.swift
//  OurPack
//
//  Created by sseungwonnn on 3/22/24.
//

import SwiftUI

// 여행 짐 하나하나를 관리하는 구조체
struct LuggageData: Identifiable {
    let id = UUID()
    var luggageItem: LuggageItem
    var packedUsers: [UserData] = [] // 해당 짐을 챙기는 사람들
    var shareableUsers: [UserData] = [] // 해당 짐을 챙긴 사람들 중에 공유할 의사가 있는 사람들
    var chosenUser: UserData = UserData(name: "default", color: .gray)// 공유되는 짐 중에서 가져올 사람들
    
    // 한 사람에게 챙길 짐을 알려줌
    mutating func getLuggage(user: UserData) -> LuggageItem {
        packedUsers.append(user)
        
        return luggageItem
    }
    
    mutating func updateShareableUsers(user: UserData) -> LuggageItem {
        packedUsers.append(user)
        
        return luggageItem
    }
}

// 한 사람의 여행 짐을 관리하는 구조체
struct LuggageItem: Identifiable {
    let id = UUID()
    let name: String
    var isPacked: Bool = false
    var isShared: Bool = false
}

// 모든 사용자의 모든 여행 짐을 관리하는 구조체
class LuggageManager {
    let everyLuggage: [LuggageData] = [
        .init(luggageItem: .init(name: "헤어 드라이기")),
        .init(luggageItem: .init(name: "고데기")),
        .init(luggageItem: .init(name: "샴푸")),
        .init(luggageItem: .init(name: "린스")),
        .init(luggageItem: .init(name: "우산")),
        .init(luggageItem: .init(name: "옷")),
        .init(luggageItem: .init(name: "신발")),
        .init(luggageItem: .init(name: "속옷"))
    ]
    
    // 여기서 짐 아이템을 입력 받으면 해당하는 LuggageData를 리턴하는 함수
    func getLuggageData(luggageItem: LuggageItem) -> LuggageData? {
        for luggageData in everyLuggage {
            if luggageData.luggageItem.id == luggageItem.id {
                return luggageData
            }
        }
        // 해당하는 LuggageData가 없을 경우 nil 반환
        return nil
    }
    
//    // 이 짐을 챙기는 사람 증가
//    func appendPackedUser(user: UserData) -> LuggageItem {
//        
//        return luggageItem
//    }
//    
//    func updateShareableUsers(user: UserData) -> LuggageItem {
//        packedUsers.append(user)
//        
//        return luggageItem
//    }
    
    
}
