//
//  MatchManager.swift
//  TinderClone
//
//  Created by Yery Castro on 26/3/24.
//

import Foundation

final class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random()
        
        if didMatch {
            matchedUser = user
        }
    }
}
