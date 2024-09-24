//
//  Address.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Contacts
import Foundation

public struct Address: Sendable, Hashable {

    public let number: Int
    public let street: String
    public let city: String
    public let postalCode: String

    public init(
        number: Int,
        street: String,
        city: String,
        postalCode: String
    ) {
        self.number = number
        self.street = street
        self.city = city
        self.postalCode = postalCode
    }

    public func formatted() -> String {
        let formatter = CNPostalAddressFormatter()

        let address = CNMutablePostalAddress()
        address.street = "\(number) \(street)"
        address.postalCode = postalCode
        address.city = city

        return formatter.string(from: address)
    }

}
