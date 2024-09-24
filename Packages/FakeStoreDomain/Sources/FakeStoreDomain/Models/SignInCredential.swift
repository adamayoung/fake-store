//
//  SignInCredential.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct SignInCredential: Sendable {

    public let username: String
    public let password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

}
