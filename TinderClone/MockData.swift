//
//  MockData.swift
//  TinderClone
//
//  Created by Yery Castro on 25/3/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        User(id: NSUUID().uuidString, fullname: "Jane Fox", age: 37, profileImageURLs: ["jane1", "jane2", "jane3"]),
        User(id: NSUUID().uuidString, fullname: "Kelly Ryan", age: 47, profileImageURLs: ["kelly1", "kelly2", "kelly3"]),
        User(id: NSUUID().uuidString, fullname: "Anna Soft", age: 43, profileImageURLs: ["lady4c"])
    ]
}
