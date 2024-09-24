//
//  Cart.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation
import Observation

@Observable
@MainActor
final class Cart {

    private(set) var items: [Cart.Item] = []

    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    var total: Double {
        items.reduce(0.0) { $0 + $1.totalPrice }
    }

    init() {}

    func add(_ product: Product) {
        guard let index = items.firstIndex(where: { $0.id == product.id }) else {
            let newItem = Cart.Item(product: product, quantity: 1)
            items.append(newItem)
            return
        }

        items[index].incrementQuantity()
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func makePurcahse(accessToken _: AccessToken) async {
        guard !items.isEmpty else {
            return
        }

        try? await Task.sleep(nanoseconds: 3_000_000_000)

        items.removeAll()
    }

}

extension Cart {

    struct Item: Identifiable, Hashable {

        private let product: Product
        private(set) var quantity: Int

        var id: Product.ID {
            product.id
        }

        var title: String {
            product.title
        }

        var price: Double {
            product.price
        }

        var totalPrice: Double {
            Double(quantity) * price
        }

        var description: String {
            product.description
        }

        var imageURL: URL {
            product.imageURL
        }

        init(product: Product, quantity: Int = 1) {
            self.product = product
            self.quantity = quantity
        }

        mutating func incrementQuantity() {
            quantity += 1
        }

    }

}
