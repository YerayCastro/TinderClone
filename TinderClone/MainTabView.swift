//
//  MainTabView.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            
            SearchView(user: MockData.users[1])
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            
            CurrentUserProfileView(user: MockData.users[1])
                .tabItem { Image(systemName: "person") }
                .tag(2)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager())
}
