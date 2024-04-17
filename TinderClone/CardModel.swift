//
//  CardModel.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import Foundation

struct CardModel: Identifiable {
    let user: User
}

extension CardModel: Hashable {
    var id: String { return user.id }
}
