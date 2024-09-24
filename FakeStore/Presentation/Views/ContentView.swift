//
//  ContentView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        MainTabView()
    }

}

#Preview {
    @Previewable @State var cart = Cart()
    @Previewable @State var accountStore = AccountStore(dependencies: .mock)

    ContentView()
        .environment(cart)
        .environment(accountStore)
}
