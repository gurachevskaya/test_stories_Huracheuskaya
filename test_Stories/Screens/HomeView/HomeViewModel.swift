//
//  HomeViewModel.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI


final class HomeViewModel: ObservableObject {
    @Published var allUsers: [User] = []
    @Published var seenUserIDs: Set<Int> = []

    private var pages: [UserPage] = []
    private var currentPage = 0
    
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    private let storiesRepository: StoriesRepositoryProtocol
    
    init(storiesRepository: StoriesRepositoryProtocol) {
        self.storiesRepository = storiesRepository
    }
    
    @MainActor
    func getStories(page: Int) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let usersResponse = try await storiesRepository.getStories()
            allUsers = usersResponse.pages[page].users
            print(allUsers)
        } catch {
            handleError(error: error as? AppError ?? .unableToComplete)
        }
    }
    
    func markSeen(_ user: User) {
        seenUserIDs.insert(user.id)
    }
    
    func isSeen(_ user: User) -> Bool {
        seenUserIDs.contains(user.id)
    }
    
    private func handleError(error: AppError) {
        alertItem = AlertItem(
            title: Text("Something went wrong"),
            message: Text("Please try again later"),
            dismissButton: .default(Text("OK"))
        )
    }
}
