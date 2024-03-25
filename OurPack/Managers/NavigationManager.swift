//
//  NavigationManager.swift
//  OurPack
//
//  Created by sseungwonnn on 3/21/24.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var packLibraryViewPath = NavigationPath()
    @Published var currentPackViewPath = NavigationPath()
    @Published var myPackViewPath = NavigationPath()
}
