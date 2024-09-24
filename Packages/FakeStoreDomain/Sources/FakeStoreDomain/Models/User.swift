//
//  User.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct User: Identifiable, Sendable, Hashable {

    public let id: Int
    public let email: String
    public let username: String
    public let firstName: String
    public let lastName: String
    public let address: Address
    public let phoneNumber: String

    public var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName

        return formatter.string(from: components)
    }

    public init(
        id: Int,
        email: String,
        username: String,
        firstName: String,
        lastName: String,
        address: Address,
        phoneNumber: String
    ) {
        self.id = id
        self.email = email
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.phoneNumber = phoneNumber
    }

}
