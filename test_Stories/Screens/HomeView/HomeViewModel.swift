//
//  HomeViewModel.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI
final class HomeViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var selectedUser: User?
    
    var topStoriesViewModel: TopStoriesViewModel
  
    init(storiesRepository: StoriesRepositoryProtocol) {
        topStoriesViewModel = TopStoriesViewModel(storiesRepository: storiesRepository)

        setupBindings()
    }
    
    private func setupBindings() {
        topStoriesViewModel.$selectedUser.assign(to: &$selectedUser)
        topStoriesViewModel.$alertItem.assign(to: &$alertItem)
        topStoriesViewModel.$isLoading.assign(to: &$isLoading)
    }
}
