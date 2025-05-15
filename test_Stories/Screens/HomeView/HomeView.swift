//
//  HomeView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            TopStoriesView(viewModel: viewModel)
            Spacer()
        }
        .task {
            await viewModel.getStories(page: 0)
        }
        
        if viewModel.isLoading {
            ProgressView("Loading..")
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            storiesRepository: StoriesRepository(),
            seenStoriesService: SeenStoriesService()
        )
    )
}
