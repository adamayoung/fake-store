//
//  AccountStoreViewModifier.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import SwiftUI

struct AccountStoreViewModifier: ViewModifier {

    @State private var accountStore = AccountStore(dependencies: DIContainer.shared.accountStore())

    func body(content: Content) -> some View {
        content
            .environment(accountStore)
    }
}

extension View {

    func accountStore() -> some View {
        modifier(AccountStoreViewModifier())
    }

}
