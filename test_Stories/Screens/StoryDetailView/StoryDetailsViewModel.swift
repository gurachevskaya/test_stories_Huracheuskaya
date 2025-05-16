//
//  StoryDetailsViewModel.swift
//  test_Stories
//
//  Created by karyna.huracheuskaya on 16/05/2025.
//

import SwiftUI

final class StoryDetailsViewModel: ObservableObject {
    var selectedUser: Binding<User?>
    
    init(user: Binding<User?>) {
        self.selectedUser = user
    }
    
    func goBack() {
        selectedUser.wrappedValue = nil
    }
}
