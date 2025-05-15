//
//  InstaTabView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct InstaTabView: View {
    var body: some View {
        TabView {
            HomeView(
                viewModel: .init(
                    storiesRepository: StoriesRepository(),
                    seenStoriesService: SeenStoriesService()
                )
            )
            .tabItem {
                Image(systemName: "house")
            }
            
            PlaceholderScreenView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            PlaceholderScreenView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
        .accentColor(Color.black)
    }
}

#Preview {
    InstaTabView()
}
