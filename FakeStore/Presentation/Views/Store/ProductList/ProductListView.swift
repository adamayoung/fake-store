//
//  ProductListView.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import SwiftUI

struct ProductListView: View {

    @State private var viewModel: ProductListViewModel

    init(viewModel: ProductListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List {
            ForEach(viewModel.groups) { group in
                Section(group.category.name) {
                    ForEach(group.products) { product in
                        NavigationLink(value: StoreRoute.product(product)) {
                            ProductListRow(product: product)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle("PRODUCTS")
    }

}

#Preview {
    NavigationStack {
        ProductListView(
            viewModel: ProductListViewModel(
                dependencies: .mock
            )
        )
    }
}
