//
//  ProductListView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct ProductListView: View {

    @State private var viewModel: ProductsListViewModel

    init(viewModel: ProductsListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List(viewModel.products) { product in
            NavigationLink(value: product) {
                ProductRow(product: product)
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle(viewModel.category.name)
    }

}

#Preview {
    NavigationStack {
        ProductListView(
            viewModel: ProductsListViewModel(
                category: ProductCategory.mock,
                dependencies: .mock
            )
        )
    }
}
