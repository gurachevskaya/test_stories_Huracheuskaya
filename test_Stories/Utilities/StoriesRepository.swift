//
//  StoriesRepository.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

protocol StoriesRepositoryProtocol {
    func getStories(page: Int) async throws -> UserPage
}

final class StoriesRepository: StoriesRepositoryProtocol {
    private var allPages: [UserPage] = []
    
    private func loadAllUsersIfNeeded() {
        guard allPages.isEmpty,
              let url = Bundle.main.url(forResource: "UsersResponse", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(UsersResponse.self, from: data)
            allPages = response.pages
        } catch {
            print("Error loading JSON: \(error)")
        }
    }
    
    func getStories(page: Int) async throws -> UserPage {
        try await Task.sleep(nanoseconds: 1_000_000_000) // simulate network delay

        loadAllUsersIfNeeded()

        guard page < allPages.count else {
            return UserPage(users: [])
        }
        
        debugPrint("Loaded page \(page)")
        debugPrint("Users: \(allPages[page])")
        
        return allPages[page]
    }
}
