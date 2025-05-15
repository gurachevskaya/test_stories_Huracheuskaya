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
    private let seenStoriesService: SeenStoriesServiceProtocol
    
    init(
        storiesRepository: StoriesRepositoryProtocol,
        seenStoriesService: SeenStoriesServiceProtocol
    ) {
        self.storiesRepository = storiesRepository
        self.seenStoriesService = seenStoriesService
    }
    
    @MainActor
    func getStories(page: Int) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let usersResponse = try await storiesRepository.getStories()
            allUsers = usersResponse.pages[page].users
            seenUserIDs = seenStoriesService.loadSeenUserIDs()
            print(allUsers)
        } catch {
            handleError(error: error as? AppError ?? .unableToComplete)
        }
    }
    
    func markSeen(_ user: User) {
        seenStoriesService.markAsSeen(userID: user.id)
        seenUserIDs = seenStoriesService.loadSeenUserIDs()
    }
    
    func isSeen(_ user: User) -> Bool {
        seenStoriesService.isSeen(userID: user.id)
    }
    
    private func handleError(error: AppError) {
        alertItem = AlertItem(
            title: Text("Something went wrong"),
            message: Text("Please try again later"),
            dismissButton: .default(Text("OK"))
        )
    }
}
