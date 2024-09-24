//
//  CartViewModifier.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import SwiftUI

struct CartViewModifier: ViewModifier {

    @State private var cart = Cart()

    func body(content: Content) -> some View {
        content
            .environment(cart)
    }
}

extension View {

    func cart() -> some View {
        modifier(CartViewModifier())
    }

}
