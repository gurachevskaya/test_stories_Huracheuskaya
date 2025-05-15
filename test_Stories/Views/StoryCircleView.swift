//
//  StoryCircleView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI
import Kingfisher

struct StoryCircleView: View {
    private enum Constants {
        static let circleSize: CGFloat = 60
    }
    
    let user: User
    let isSeen: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                onTap()
            }) {
                storyImageCircle
            }
            .buttonStyle(PlainButtonStyle())
            
            Text(user.name)
                .frame(maxWidth: Constants.circleSize)
                .lineLimit(1)
                .font(.caption)
        }
    }
    
    private var storyImageCircle: some View {
        Circle()
            .strokeBorder(
                isSeen ? Color.gray : Color.blue,
                lineWidth: 3
            )
            .background(
                KFImage(user.profilePictureURL)
                    .resizable()
                    .scaledToFill()
            )
            .clipShape(Circle())
            .frame(width: Constants.circleSize, height: Constants.circleSize)
    }
}

#Preview {
    StoryCircleView(
        user: .init(
            id: 1,
            name: "name",
            profilePictureURL: URL(string: "https://picsum.photos/id/237/200/300")!
        ),
        isSeen: false,
        onTap: {}
    )
}
