//
//  AddressMapper.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct AddressMapper {

    private init() {}

    static func map(from dataModel: AddressDataModel) -> Address {
        Address(
            number: dataModel.number,
            street: dataModel.street.localizedCapitalized,
            city: dataModel.city.localizedCapitalized,
            postalCode: dataModel.zipcode
        )
    }

}
