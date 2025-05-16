//
//  StoriesNetworkServiceMock.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 16/05/2025.
//

import Foundation

protocol StoriesNetworkServiceProtocol {
    func getStories() async throws -> [UserPage]
}

final class StoriesNetworkServiceMock: StoriesNetworkServiceProtocol {
    func getStories() async throws -> [UserPage] {
        guard let url = Bundle.main.url(forResource: "UsersResponse", withExtension: "json") else {
            throw AppError.unableToComplete
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(UsersResponse.self, from: data)
            return response.pages
        } catch {
            throw AppError.invalidData
        }
    }
}
