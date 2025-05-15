//
//  SeenStoriesService.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

protocol SeenStoriesServiceProtocol {
    func markAsSeen(userID: Int)
    func isSeen(userID: Int) -> Bool
    func loadSeenUserIDs() -> Set<Int>
}

final class SeenStoriesService: SeenStoriesServiceProtocol {
    private enum Constants {
        static let seenUserIDsKey = "seenUserIDs"
    }
    private var seenUserIDs: Set<Int>
    
    private let storage: PersistentStorage

    init(storage: PersistentStorage = UserDefaultsStorage()) {
        self.storage = storage
        self.seenUserIDs = storage.load(forKey: Constants.seenUserIDsKey) ?? []
    }

    func markAsSeen(userID: Int) {
        seenUserIDs.insert(userID)
        storage.save(Array(seenUserIDs), forKey: Constants.seenUserIDsKey)
    }

    func isSeen(userID: Int) -> Bool {
        seenUserIDs.contains(userID)
    }

    func loadSeenUserIDs() -> Set<Int> {
        seenUserIDs
    }
}
