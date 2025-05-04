//
//  AuthService.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//

import Foundation

struct AuthService {
    func login(username: String, password: String) async throws -> UserToken {
        // Simulated login
        try await Task.sleep(nanoseconds: 1_000_000_000)

        if username == "user" && password == "pass" {
            return UserToken(token: "1234567890")
        } else {
            throw AuthError.invalidCredentials
        }
    }

    enum AuthError: LocalizedError {
        case invalidCredentials

        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Invalid username or password."
            }
        }
    }
}
