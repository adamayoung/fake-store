//
//  MainTabView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct MainTabView: View {

    @State private var customization = TabViewCustomization()
    @State var tabSelection = 0

    @Environment(Cart.self)
    private var cart

    var body: some View {
        TabView {
            Tab("STORE", systemImage: "storefront") {
                StoreNavigationView(
                    viewModel: StoreNavigationViewModel(dependencies: DIContainer.shared.storeNavigation())
                )
            }
            .customizationID("fakestore.tab.store")

            Tab("CART", systemImage: "cart") {
                CartNavigationView()
            }
            .customizationID("fakestore.tab.cart")

            Tab("ACCOUNT", systemImage: "person.crop.circle") {
                AccountNavigationView()
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
