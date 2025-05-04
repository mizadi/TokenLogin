//
//  LoginView.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//

// Views/LoginView.swift
import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = AuthViewModel()
    var onLoginSuccess: () -> Void
    @State private var isLoading: Bool = false  // Track loading state

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: viewModel.username) {
                        viewModel.username = viewModel.username.lowercased()
                    }

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if let error = viewModel.error {
                    Text(error).foregroundColor(.red)
                }

                Button("Login") {
                    Task {
                        isLoading = true // Show loading indicator
                        switch await viewModel.login() {
                        case .success:
                            onLoginSuccess()
                        case .failure(let error):
                            viewModel.error = error.localizedDescription
                        }
                        isLoading = false // Hide loading indicator
                    }
                }
                .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty || isLoading)  // Disable button while loading
            }
            .padding()

            // Overlay activity indicator when loading
            if isLoading {
                Color.black.opacity(0.5) // Semi-transparent background
                    .edgesIgnoringSafeArea(.all)

                ProgressView("Logging in...") // Activity indicator
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2) // Optional: increase size
                    .foregroundColor(.white)
            }
        }
    }
}
