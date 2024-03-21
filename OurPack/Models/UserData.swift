//
//  UserData.swift
//  OurPack
//
//  Created by sseungwonnn on 3/21/24.
//

import SwiftUI

struct UserData: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var color: Color
}
