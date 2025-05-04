//
//  AuthViewModel.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var error: String?

    private var authService: AuthService
    private var tokenManager: TokenManager

    init(authService: AuthService = AuthService(), tokenManager: TokenManager = TokenManager()) {
        self.authService = authService
        self.tokenManager = tokenManager
    }

    func login() async -> Result<Void, Error> {
        do {
            let token = try await authService.login(username: username, password: password)
            tokenManager.save(token: token)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
