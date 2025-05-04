//
//  HomeView.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//

import SwiftUI

struct HomeView: View {
    var onLogout: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome 🎉")
                .font(.largeTitle)

            Button("Logout") {
                onLogout()
            }
        }
    }
}
