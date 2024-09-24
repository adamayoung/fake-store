//
//  CartItem+Mocks.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

extension Cart.Item {

    static func mock(quantity: Int = 1) -> Self {
        Cart.Item(
            product: .mock,
            quantity: quantity
        )
    }

}
