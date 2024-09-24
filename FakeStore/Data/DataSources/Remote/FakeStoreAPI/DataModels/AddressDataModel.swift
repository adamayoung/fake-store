//
//  AddressDataModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct AddressDataModel: Decodable {

    let number: Int
    let street: String
    let city: String
    let zipcode: String

}
