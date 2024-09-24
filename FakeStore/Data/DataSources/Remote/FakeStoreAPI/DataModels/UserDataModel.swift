//
//  UserDataModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct UserDataModel: Decodable {

    let id: Int
    let email: String
    let username: String
    let password: String
    let name: NameDataModel
    let address: AddressDataModel
    let phone: String

}

extension UserDataModel {

    struct NameDataModel: Decodable {
        let firstname: String
        let lastname: String
    }

}
