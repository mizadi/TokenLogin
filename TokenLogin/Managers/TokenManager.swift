//
//  TokenManager.swift
//  TokenLogin
//
//  Created by Adi Mizrahi on 04/05/2025.
//


// Utils/TokenManager.swift
import Foundation

import Security

class TokenManager {
    private let service = "com.adimizrahi.TokenLogin"
    private let account = "userToken"

    func save(token: UserToken) {
        let tokenData = token.token.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: tokenData
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    func loadToken() -> UserToken? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        if status == errSecSuccess,
           let data = result as? Data,
           let tokenString = String(data: data, encoding: .utf8) {
            return UserToken(token: tokenString)
        }

        return nil
    }

    func clear() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        SecItemDelete(query as CFDictionary)
    }
}
