# SocialChampTask

A Flutter project demonstrating user management features with state management using BLoC and Cubit.

## Overview
This project implements a user list with functionalities such as:

- Fetching users from an API.
- Searching users by name, phone, or ID.
- Adding new users.
- Deleting users from the list.

### Features

#### 1. **User Management**
   - Fetch all users and display them in a scrollable list.
   - Add new users via a dedicated `AddUserPage`.
   - Delete users from both the main user list and search results.

#### 2. **Search Functionality**
   - Real-time search capability to filter users by name, phone, or ID.
   - Utilizes `UserSearchCubit` to manage search results independently of the main user list.

#### 3. **State Management**
   - BLoC is used to manage the state for user loading, addition, and deletion.
   - Cubit handles search functionality to keep it modular and independent.

#### 4. **UI Highlights**
   - Custom user card widget to display user details with delete functionality.
   - Search bar to filter the user list dynamically.
   - Floating action button to navigate to the `AddUserPage`.
   - Refresh indicator to reload the user list.

## Architecture
This project uses the following architecture:

- **BLoC (Business Logic Component):** Handles state transitions and business logic for user management.
- **Cubit:** Simplifies managing search-related states.

## Key Files

- **User List Page:** `user_list_page.dart`
- **Add User Page:** `add_user_page.dart`
- **BLoC and States:**
  - `users_bloc.dart`
  - `users_event.dart`
  - `users_state.dart`
- **Search Cubit:**
  - `user_search_cubit.dart`
  - `user_search_state.dart`
- **Widgets:**
  - `user_list_tile.dart`
  - `loading_indicator.dart`
  - `error_message.dart`

## How to Run the Project

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:
   ```bash
   cd socialchamptask
   ```

3. Get the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Future Enhancements

- Integrate persistent storage for offline capabilities.
- Add user editing functionality.
- Enhance search by supporting multiple criteria simultaneously.
- Add unit and widget tests for robustness.

## Resources

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

