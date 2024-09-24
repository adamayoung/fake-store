//
//  UserMapper.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

struct UserMapper {

    private init() {}

    static func map(from dataModel: UserDataModel) -> User {
        let address = AddressMapper.map(from: dataModel.address)

        return User(
            id: dataModel.id,
            email: dataModel.email,
            username: dataModel.username,
            firstName: dataModel.name.firstname.localizedCapitalized,
            lastName: dataModel.name.lastname.localizedCapitalized,
            address: address,
            phoneNumber: dataModel.phone
        )
    }

}
