# TokenLogin

Simple SwiftUI app that demonstrates login with token storage using Keychain.

## Features

- Login screen with username/password
- Converts username to lowercase automatically
- Disables login button when inputs are invalid
- Blocks UI with activity indicator while logging in
- Stores the user token securely in Keychain
- Supports logout and session restore via token

## Structure

- `LoginView.swift`: UI for logging in. Shows errors, disables UI while loading, and converts username to lowercase.
- `HomeView.swift`: Simple logged-in screen with logout button.
- `AuthViewModel.swift`: Handles login logic using `AuthService` and manages state.
- `TokenManager.swift`: Wrapper for storing and retrieving token using Keychain (replaces UserDefaults).
- `TokenLoginApp.swift`: Entry point. Shows `LoginView` or `HomeView` depending on token state.

## Keychain

We're not using `UserDefaults` for token storage. Tokens are sensitive and should be stored securely, so we use `Keychain` instead. `TokenManager` handles it.

## Run

Standard SwiftUI app. Just run it in Xcode.

## TODO

- Replace `AuthService` with real network call
- Add tests
- Add error handling for token loading failures

---

Let me know if you want to connect this to a backend or expand the login logic.
