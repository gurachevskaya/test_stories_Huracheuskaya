//
//  TopStoriesViewModel.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 16/05/2025.
//

import SwiftUI

final class TopStoriesViewModel: ObservableObject {
    @Published var allUsers: [User] = []
    @Published var selectedUser: User?
    @Published var seenUserIDs: Set<Int> = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    private var currentPage = 0
    private var canLoadMorePages = true

    private let storiesRepository: StoriesRepositoryProtocol

    init(storiesRepository: StoriesRepositoryProtocol) {
        self.storiesRepository = storiesRepository

        Task {
            await getStories()
        }
    }

    @MainActor
    func getStories() async {
        guard !isLoading && canLoadMorePages else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            let usersPage = try await storiesRepository.getStories(page: currentPage)
            allUsers.append(contentsOf: usersPage.users)

            currentPage += 1
            canLoadMorePages = usersPage.users.count > 0
            seenUserIDs = storiesRepository.loadSeenUserIDs()
        } catch {
            handleError(error: error as? AppError ?? .unableToComplete)
        }
    }

    func storyTapped(_ user: User) {
        selectedUser = user
        markSeen(user)
    }

    private func markSeen(_ user: User) {
        storiesRepository.markAsSeen(userID: user.id)
        seenUserIDs = storiesRepository.loadSeenUserIDs()
    }

    func isSeen(_ user: User) -> Bool {
        storiesRepository.isSeen(userID: user.id)
    }

    private func handleError(error: AppError) {
        alertItem = AlertItem(
            title: Text("Something went wrong"),
            message: Text("Please try again later"),
            dismissButton: .default(Text("OK"))
        )
    }
}
