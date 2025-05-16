//
//  StoryDetailView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject var viewModel: StoryDetailsViewModel
    
    var body: some View {
        VStack {
            Text("Story of a \(viewModel.selectedUser.wrappedValue?.name ?? "")")
            Button("Back") {
                viewModel.goBack()
            }
        }
    }
}

#Preview {
    StoryDetailView(viewModel: .init(user: .constant(nil)))
}
