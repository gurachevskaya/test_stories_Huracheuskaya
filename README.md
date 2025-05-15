# Technical Test

## Tech Stack

- **Language**: Swift & SwiftUI
- **iOS Version**: 16.6
- **Architecture**: MVVM  
- **Storage**: `UserDefaults`  
- **Dependencies**: [Kingfisher](https://github.com/onevcat/Kingfisher) via Swift Package Manager (includes built-in image caching)

---

## Features

- Tab bar with an empty Home screen and a horizontal Stories scroll view at the top
- Image downloading and display
- Pagination support
- Seen/Unseen story state tracking
- Persistent states across app sessions
- Navigation to individual Story screen

---

## Areas for Improvement

- **Dependency Injection**: Integrate a DI container (e.g. [Swinject](https://github.com/Swinject/Swinject))  
- **Navigation**: Implement a Coordinator pattern for more scalable navigation management  
- **Like Service**: Add a `LikeService` or extend the current `SeenStoriesService` to support like/unlike functionality  
- **Storage**: Replace `UserDefaults` with a more suitable solution such as **Core Data** or **Realm**  
  - Alternatively, fetch and persist state from a backend for better reliability and sync  
- **Testing**: Add unit tests (especially for ViewModels and Services) and UI tests

---

## Setup Instructions

1. Clone the repository
2. Open the `.xcodeproj` or `.xcworkspace` file
3. Run the app using the latest Xcode version




https://github.com/user-attachments/assets/601e85de-4287-4210-9277-922cd3517f12



