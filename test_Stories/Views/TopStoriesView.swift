//
//  StoryCircleView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct TopStoriesView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.allUsers) { user in
                    StoryCircleView(
                        user: user,
                        isSeen: viewModel.isSeen(user),
                        onTap: { viewModel.markSeen(user)}
                    )
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 120)
    }
}

#Preview {
    TopStoriesView(
        viewModel: .init(
            storiesRepository: StoriesRepository(),
            seenStoriesService: SeenStoriesService()
        )
    )
}
