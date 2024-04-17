//
//  CardService.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0) })
    }
}
