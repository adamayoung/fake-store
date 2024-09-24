//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

@main
struct FakeStoreApp: App {

    @State private var cart = Cart()
    @State private var accountStore = AccountStore(dependencies: DIContainer.shared.accountStore())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cart)
                .environment(accountStore)
        }
    }
}
