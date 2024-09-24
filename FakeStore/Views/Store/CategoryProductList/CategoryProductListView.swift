//
//  CategoryProductListView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import SwiftUI

struct CategoryProductListView: View {

    @State private var viewModel: CategoryProductListViewModel

    init(viewModel: CategoryProductListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List(viewModel.products) { product in
            NavigationLink(value: StoreRoute.product(product)) {
                ProductListRow(product: product)
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
        CategoryProductListView(
            viewModel: CategoryProductListViewModel(
                category: ProductCategory.mock,
                dependencies: .mock
            )
        )
    }
}
