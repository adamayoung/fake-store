//
//  User+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

extension User {

    static var mock: Self {
        .init(
            id: 1,
            email: "john@gmail.com",
            username: "johnd",
            firstName: "John",
            lastName: "Doe",
            address: Address(
                number: 7682,
                street: "New Road",
                city: "Kilcoole",
                postalCode: "12926-3874"
            ),
            phoneNumber: "1-570-236-7033"
        )
    }

}
