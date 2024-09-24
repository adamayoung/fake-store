//
//  User.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct User: Identifiable, Sendable, Hashable {

    let id: Int
    let email: String
    let username: String
    let firstName: String
    let lastName: String
    let address: Address
    let phoneNumber: String

    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName

        return formatter.string(from: components)
    }

}
