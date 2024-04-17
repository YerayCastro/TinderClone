//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

@main
struct TinderCloneApp: App {
    @StateObject var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}
