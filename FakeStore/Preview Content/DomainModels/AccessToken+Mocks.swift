//
//  AccessToken+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

extension AccessToken {

    static var mock: Self {
        .init(value: "1234567890")
    }

}
