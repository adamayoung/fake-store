//
//  CategoryListView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CategoryListView: View {

    @State private var viewModel: CategoryListViewModel

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(viewModel: CategoryListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List {
            Section {
                ForEach(viewModel.categories) { category in
                    NavigationLink(value: StoreRoute.categoryProductList(category)) {
                        Label(category.name, systemImage: category.imageName)
                    }
                }
            }

            Section {
                NavigationLink(value: StoreRoute.allProducts) {
                    Label("ALL_PRODUCTS", systemImage: "shippingbox")
                }
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle("CATEGORIES")
    }
}

#Preview {
    NavigationStack {
        CategoryListView(
            viewModel: CategoryListViewModel(dependencies: .mock)
        )
    }
}
