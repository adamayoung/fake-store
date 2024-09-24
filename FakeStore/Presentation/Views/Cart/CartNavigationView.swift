//
//  CartNavigationView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CartNavigationView: View {

    var body: some View {
        NavigationStack {
            CartView()
        }
    }

}

#Preview {
    @Previewable @State var cart = Cart()
    @Previewable @State var accountStore = AccountStore(
        user: nil,
        accessToken: nil,
        dependencies: .mock
    )

    CartNavigationView()
        .environment(cart)
        .environment(accountStore)
}
