//
//  CartView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CartView: View {

    @Environment(Cart.self)
    private var cart: Cart

    @Environment(AccountStore.self)
    private var accountStore: AccountStore

    @State private var isPurchasing = false
    @State private var isPurcahseSuccessfulShowing = false

    var body: some View {
        List {
            if !cart.items.isEmpty {
                Section {
                    ForEach(cart.items) { item in
                        CartItemRow(item: item)
                    }
                    .onDelete(perform: delete)
                }

                Section {
                    LabeledContent("SUBTOTAL") {
                        Text("\(cart.total, format: .currency(code: "GBP"))")
                    }
                    .font(.headline)
                }

                if accountStore.isLoggedIn {
                    Section {
                        buyNowRow
                    }
                }
            }
        }
        .overlay {
            if cart.items.isEmpty {
                ContentUnavailableView("CART_EMPTY", systemImage: "cart")
            }
        }
        .navigationTitle("CART")
        .alert(
            "PURCHASE_SUCCESSFUL",
            isPresented: $isPurcahseSuccessfulShowing,
            actions: {
                Button("OK") {
                    isPurcahseSuccessfulShowing = false
                }
            },
            message: {
                Text("YOUR_PURCHASE_WAS_SUCCESSFUL")
            }
        )
    }

    @ViewBuilder private var buyNowRow: some View {
        HStack {
            Spacer()
            Button("BUY_NOW") {
                makePurchase()
            }
            .opacity(isPurchasing ? 0 : 1)
            .disabled(isPurchasing)
            .overlay {
                if isPurchasing {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            Spacer()
        }
    }

    private func delete(at offsets: IndexSet) {
        cart.remove(at: offsets)
    }

    private func makePurchase() {
        guard let accessToken = accountStore.accessToken else {
            return
        }

        #if os(iOS)
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        #endif

        isPurchasing = true
        Task {
            await cart.makePurcahse(accessToken: accessToken)
            isPurchasing = false
            isPurcahseSuccessfulShowing = true
        }
    }

}

#Preview("Signed Out") {
    @Previewable @State var cart = Cart()
    @Previewable @State var accountStore = AccountStore(
        user: nil,
        accessToken: nil,
        dependencies: .mock
    )

    NavigationStack {
        CartView()
    }
    .environment(cart)
    .environment(accountStore)
}

#Preview("Signed In") {
    @Previewable @State var cart = Cart()
    @Previewable @State var accountStore = AccountStore(
        user: .mock,
        accessToken: .mock,
        dependencies: .mock
    )

    NavigationStack {
        CartView()
    }
    .environment(cart)
    .environment(accountStore)
}
