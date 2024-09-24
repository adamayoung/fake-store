//
//  CategoryFastStoreAPIDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class CategoryFastStoreAPIDataSource: CategoryRemoteDataSource {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func categories() async throws -> [ProductCategory] {
        let url = FakeStoreAPIEndpoint.categories.url
        let (data, _) = try await urlSession.data(from: url)
        let categoryDataModels = try JSONDecoder().decode([String].self, from: data)

        let categories = categoryDataModels.map(ProductCategoryMapper.map)

        return categories
    }

}
