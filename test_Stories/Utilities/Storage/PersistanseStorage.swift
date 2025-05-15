//
//  PersistanseStorage.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

protocol PersistentStorage {
    func save<T: Codable>(_ value: T, forKey key: String)
    func load<T: Codable>(forKey key: String) -> T?
    func removeValue(forKey key: String)
}
