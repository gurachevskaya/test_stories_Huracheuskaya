//
//  StoriesRepository.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

protocol StoriesRepositoryProtocol {
    func getStories(page: Int) async throws -> UserPage
    func markAsSeen(userID: Int)
    func isSeen(userID: Int) -> Bool
    func loadSeenUserIDs() -> Set<Int>
}

final class StoriesRepository: StoriesRepositoryProtocol {
    private let seenStoriesService: SeenStoriesServiceProtocol
    private let storiesNetworkService: StoriesNetworkServiceProtocol
    
    init(
        seenStoriesService: SeenStoriesServiceProtocol = SeenStoriesService(),
        storiesNetworkService: StoriesNetworkServiceProtocol = StoriesNetworkServiceMock()
    ) {
        self.seenStoriesService = seenStoriesService
        self.storiesNetworkService = storiesNetworkService
    }
    
    private var allPages: [UserPage] = []
    
    func getStories(page: Int) async throws -> UserPage {
        try await Task.sleep(nanoseconds: 1_000_000_000) // simulate network delay

        try await loadAllUsersIfNeeded()

        guard page < allPages.count else {
            return UserPage(users: [])
        }
        
        debugPrint("Loaded page \(page)")
        debugPrint("Users: \(allPages[page])")
        
        return allPages[page]
    }
    
    func markAsSeen(userID: Int) {
        seenStoriesService.markAsSeen(userID: userID)
    }
    
    func isSeen(userID: Int) -> Bool {
        seenStoriesService.isSeen(userID: userID)
    }
    
    func loadSeenUserIDs() -> Set<Int> {
        seenStoriesService.loadSeenUserIDs()
    }
    
    private func loadAllUsersIfNeeded() async throws {
        guard allPages.isEmpty else { return }
        allPages = try await storiesNetworkService.getStories()
    }
    
}
