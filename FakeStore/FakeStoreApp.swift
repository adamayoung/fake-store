//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

@main
struct FakeStoreApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .cart()
                .accountStore()
        }
    }
}
