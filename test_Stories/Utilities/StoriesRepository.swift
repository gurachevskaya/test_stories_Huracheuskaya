//
//  StoriesRepository.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import Foundation

protocol StoriesRepositoryProtocol {
    func getStories() async throws -> UsersResponse
}

final class StoriesRepository: StoriesRepositoryProtocol {
    func getStories() async throws -> UsersResponse {
        
        guard let url = Bundle.main.url(forResource: "UsersResponse", withExtension: "json") else {
            throw AppError.unableToComplete
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(UsersResponse.self, from: data)
    }
}
