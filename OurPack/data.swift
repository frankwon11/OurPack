//
//  data.swift
//  OurPack
//
//  Created by sseungwonnn on 3/21/24.
//

import SwiftUI

let SHUWN: UserData = .init(name: "Shuwn", color: .blue)
let SADIE: UserData = .init(name: "Sadie", color: .red)
let MAC: UserData = .init(name: "MAC", color: .green)
let HAZEL: UserData = .init(name: "HAZEL", color: .yellow)
let NOW: UserData = .init(name: "NOW", color: .indigo)

let USER: UserData = .init(name: "Shuwn", color: .blue)

var FRIENDS: [UserData] = [SADIE, MAC]

let LUGGAGES: [String] = [
    "여권", "지갑", "보조 배터리", "볼펜", "목베개", "옷", "속옷",
    "양말", "잠옷", "신발", "모자", "상비약", "화장품", "어댑터",
    "우산", "헤어 드라이기", "고데기", "지퍼백", "삼각대", "셀카봉",
    "물티슈", "샤워기 필터", "세탁 세제", "스킨 로션", "자외선차단제",
    "폼클렌징", "칫솔", "치약", "가글", "샴푸", "린스", "바디로션",
    "인공눈물", "머리끈", "빗", "수건", "면도기", "수영복",
    "방수팩", "선글라스", "목도리", "방한용품"
]

var TRAVELMANAGER: [String: LuggageData] = [
    "여권": LuggageData(luggageItem: .init(name: "여권")),
    "지갑": LuggageData(luggageItem: .init(name: "지갑")),
    "보조 배터리": LuggageData(luggageItem: .init(name: "보조 배터리"), shareableUsers: [SHUWN, SADIE, MAC], chosenUser: MAC),
    "볼펜": LuggageData(luggageItem: LuggageItem(name: "볼펜")),
    "목베개": LuggageData(luggageItem: LuggageItem(name: "목베개")),
    "옷": LuggageData(luggageItem: LuggageItem(name: "옷"), shareableUsers: [SHUWN, SADIE, MAC], chosenUser: SHUWN),
    "속옷": LuggageData(luggageItem: LuggageItem(name: "속옷")),
    "양말": LuggageData(luggageItem: LuggageItem(name: "양말")),
    "잠옷": LuggageData(luggageItem: LuggageItem(name: "잠옷")),
    "신발": LuggageData(luggageItem: LuggageItem(name: "신발")),
    "모자": LuggageData(luggageItem: LuggageItem(name: "모자")),
    "상비약": LuggageData(luggageItem: LuggageItem(name: "상비약"), shareableUsers: [SHUWN, SADIE, HAZEL, MAC, NOW], chosenUser: NOW),
    "화장품": LuggageData(luggageItem: LuggageItem(name: "화장품")),
    "어댑터": LuggageData(luggageItem: LuggageItem(name: "어댑터")),
    "우산": LuggageData(luggageItem: LuggageItem(name: "우산")),
    "헤어 드라이기": LuggageData(luggageItem: LuggageItem(name: "헤어 드라이기"), shareableUsers: [SHUWN, SADIE, MAC]),
    "고데기": LuggageData(luggageItem: LuggageItem(name: "고데기")),
    "지퍼백": LuggageData(luggageItem: LuggageItem(name: "지퍼백")),
    "삼각대": LuggageData(luggageItem: LuggageItem(name: "삼각대")),
    "셀카봉": LuggageData(luggageItem: LuggageItem(name: "셀카봉")),
    "물티슈": LuggageData(luggageItem: LuggageItem(name: "물티슈")),
    "샤워기 필터": LuggageData(luggageItem: LuggageItem(name: "샤워기 필터")),
    "세탁 세제": LuggageData(luggageItem: LuggageItem(name: "세탁 세제")),
    "스킨 로션": LuggageData(luggageItem: LuggageItem(name: "스킨 로션")),
    "자외선차단제": LuggageData(luggageItem: LuggageItem(name: "자외선차단제"), shareableUsers: [SHUWN, MAC], chosenUser: SHUWN),
    "폼클렌징": LuggageData(luggageItem: LuggageItem(name: "폼클렌징"), shareableUsers: [SHUWN, MAC], chosenUser: MAC),
    "칫솔": LuggageData(luggageItem: LuggageItem(name: "칫솔")),
    "치약": LuggageData(luggageItem: LuggageItem(name: "치약"), shareableUsers: [SADIE, HAZEL, NOW], chosenUser: HAZEL),
    "가글": LuggageData(luggageItem: LuggageItem(name: "가글")),
    "샴푸": LuggageData(luggageItem: LuggageItem(name: "샴푸"), shareableUsers: [SHUWN, MAC], chosenUser: MAC),
    "린스": LuggageData(luggageItem: LuggageItem(name: "린스")),
    "바디로션": LuggageData(luggageItem: LuggageItem(name: "바디로션"), shareableUsers: [SHUWN, SADIE, NOW], chosenUser: SADIE),
    "인공눈물": LuggageData(luggageItem: LuggageItem(name: "인공눈물"), shareableUsers: [SHUWN, SADIE, HAZEL, ], chosenUser: SHUWN),
    "머리끈": LuggageData(luggageItem: LuggageItem(name: "머리끈")),
    "빗": LuggageData(luggageItem: LuggageItem(name: "빗")),
    "수건": LuggageData(luggageItem: LuggageItem(name: "수건")),
    "면도기": LuggageData(luggageItem: LuggageItem(name: "면도기")),
    "수영복": LuggageData(luggageItem: LuggageItem(name: "수영복")),
    "방수팩": LuggageData(luggageItem: LuggageItem(name: "방수팩")),
    "선글라스": LuggageData(luggageItem: LuggageItem(name: "선글라스")),
    "목도리": LuggageData(luggageItem: LuggageItem(name: "목도리")),
    "방한용품": LuggageData(luggageItem: LuggageItem(name: "방한용품"))
]
