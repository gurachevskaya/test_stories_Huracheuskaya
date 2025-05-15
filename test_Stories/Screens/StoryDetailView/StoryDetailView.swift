//
//  StoryDetailView.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 15/05/2025.
//

import SwiftUI

struct StoryDetailView: View {
    @Binding var selectedUser: User?
    
    var body: some View {
        VStack {
            Text("Story of a \(selectedUser?.name ?? "user")")
            Button("Back") {
                selectedUser = nil
            }
        }
    }
}

#Preview {
    StoryDetailView(selectedUser: .constant(nil))
}
