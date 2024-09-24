//
//  MainTabView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct MainTabView: View {

    @State private var customization = TabViewCustomization()

    @Environment(Cart.self)
    private var cart

    var body: some View {
        TabView {
            Tab {
                CatalogueNavigationView()
            } label: {
                Label("STORE", systemImage: "storefront")
            }
            .customizationID("fakestore.tab.store")

            Tab {
                CartNavigationView()
            } label: {
                Label("CART", systemImage: "cart")
            }
            .badge(cart.itemCount)
            .customizationID("fakestore.tab.cart")

            Tab {
                AccountNavigationView()
            } label: {
                Label("ACCOUNT", systemImage: "person.crop.circle")
            }
            .customizationID("fakestore.tab.account")
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
    }

}

#Preview {
    @Previewable @State var cart = Cart()
    @Previewable @State var accountStore = AccountStore(dependencies: .mock)

    MainTabView()
        .environment(cart)
        .environment(accountStore)
}
