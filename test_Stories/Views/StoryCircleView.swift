//
//  StoryCircleView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct StoryCircleView: View {
    private enum Constants {
        static let circleSize: CGFloat = 60
    }
    
    let user: User
    let isSeen: Bool
    let onTap: () -> Void

    var body: some View {
        VStack {
            Circle()
                .strokeBorder(
                    isSeen ? Color.gray : Color.blue,
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
                .frame(width: Constants.circleSize, height: Constants.circleSize)

            Text(user.name)
                .frame(maxWidth: Constants.circleSize)
                .lineLimit(1)
                .font(.caption)
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    StoryCircleView(
        user: .init(
            id: 1,
            name: "name",
            profilePictureURL: URL(string: "")!
        ),
        isSeen: false,
        onTap: {}
    )
}
