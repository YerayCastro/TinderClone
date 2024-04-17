//
//  User.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    let age: Int
    let profileImageURLs: [String]
}
