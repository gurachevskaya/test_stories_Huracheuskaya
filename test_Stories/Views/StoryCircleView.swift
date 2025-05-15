//
//  StoryCircleView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct StoryCircleView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.allUsers) { user in
                    VStack {
                        Circle()
                            .strokeBorder(
                                viewModel.isSeen(user) ? Color.gray : Color.blue,
                                lineWidth: 3
                            )
                            .background(
                                AsyncImage(url: user.profilePictureURL) { image in
                                    image.resizable().scaledToFill()
                                } placeholder: {
                                    Color.gray
                                }
                            )
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                        
                        Text(user.name)
                            .font(.caption)
                    }
                    .onTapGesture {
                        viewModel.markSeen(user)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    StoryCircleView(viewModel: .init(storiesRepository: StoriesRepository()))
}
