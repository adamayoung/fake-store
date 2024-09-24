//
//  StoreNavigationView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import SwiftUI

struct StoreNavigationView: View {

    @State private var viewModel: StoreNavigationViewModel

    @State private var searchText = ""

    init(viewModel: StoreNavigationViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            CategoryListView(viewModel: CategoryListViewModel(dependencies: DIContainer.shared.categoryList()))
                .navigationDestination(for: StoreRoute.self) { route in
                    switch route {
                    case .allProducts:
                        ProductListView(
                            viewModel: ProductListViewModel(
                                dependencies: DIContainer.shared.productList()
                            )
                        )

                    case let .categoryProductList(category):
                        CategoryProductListView(
                            viewModel: CategoryProductListViewModel(
                                category: category,
                                dependencies: DIContainer.shared.categoryProductList()
                            )
                        )

                    case let .product(product):
                        ProductDetailsView(
                            viewModel: ProductDetailsViewModel(
                                product: product,
                                dependencies: DIContainer.shared.productDetails()
                            )
                        )
                    }
                }
        }
        .searchable(text: $searchText) {
            ForEach(viewModel.products) { product in
                NavigationLink(value: StoreRoute.product(product)) {
                    ProductListRow(product: product)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .onChange(of: searchText) { _, query in
            Task {
                await viewModel.search(for: query)
            }
        }
    }

}

enum StoreRoute: Hashable {

    case allProducts
    case categoryProductList(ProductCategory)
    case product(Product)

}
