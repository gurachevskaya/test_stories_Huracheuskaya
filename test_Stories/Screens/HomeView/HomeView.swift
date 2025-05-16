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
        ZStack {
            VStack {
                TopStoriesView(viewModel: viewModel.topStoriesViewModel)
                Spacer()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton
                )
            }
            if viewModel.isLoading {
                ProgressView("Loading..")
            }
        }
        .fullScreenCover(item: $viewModel.selectedUser) { user in
            StoryDetailView(viewModel: .init(user: $viewModel.selectedUser))
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(storiesRepository: StoriesRepository())
    )
}
