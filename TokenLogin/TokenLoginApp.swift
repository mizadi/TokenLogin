//
//  TokenLoginApp.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//

import SwiftUI

@main
struct TokenLoginApp: App {
    @State private var isLoggedIn: Bool = TokenManager().loadToken() != nil

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                HomeView {
                    TokenManager().clear()
                    isLoggedIn = false
                }
            } else {
                LoginView {
                    isLoggedIn = true
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    isLoggedIn = TokenManager().loadToken() != nil
                }
            }
        }
    }
}
