//
//  User.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

struct UsersResponse: Decodable {
    let pages: [UserPage]
}

struct UserPage: Decodable {
    let users: [User]
}

struct User: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let profilePictureURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePictureURL = "profile_picture_url"
    }
}
