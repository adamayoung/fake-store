//
//  CategoryListView.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import SwiftUI

struct CategoryListView: View {

    @State private var viewModel: CategoryListViewModel

    init(viewModel: CategoryListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        List(viewModel.categories) { category in
            NavigationLink(value: category) {
                Text(verbatim: category.name)
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
