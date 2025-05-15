//
//  UserDefaultsStorage.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

final class UserDefaultsStorage: PersistentStorage {
    private let defaults = UserDefaults.standard

    func save<T: Codable>(_ value: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key)
        }
    }

    func load<T: Codable>(forKey key: String) -> T? {
        guard let data = defaults.data(forKey: key),
              let value = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return value
    }

    func removeValue(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
