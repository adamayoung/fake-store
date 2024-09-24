//
//  Address.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Contacts
import Foundation

struct Address: Sendable, Hashable {

    let number: Int
    let street: String
    let city: String
    let postalCode: String

    func formatted() -> String {
        let formatter = CNPostalAddressFormatter()

        let address = CNMutablePostalAddress()
        address.street = "\(number) \(street)"
        address.postalCode = postalCode
        address.city = city

        return formatter.string(from: address)
    }

}
