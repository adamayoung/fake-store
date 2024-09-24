//
//  CatalogueNavigationView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CatalogueNavigationView: View {

    var body: some View {
        NavigationStack {
            CategoryListView(viewModel: CategoryListViewModel(dependencies: DIContainer.shared.categoryList()))
                .navigationDestination(for: ProductCategory.self) { category in
                    ProductListView(
                        viewModel: ProductsListViewModel(
                            category: category,
                            dependencies: DIContainer.shared.productList()
                        )
                    )
                }
                .navigationDestination(for: Product.self) { product in
                    ProductDetailsView(
                        viewModel: ProductDetailsViewModel(
                            product: product,
                            dependencies: DIContainer.shared.productDetails()
                        )
                    )
                }
        }
    }

}
