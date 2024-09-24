//
//  ProductFastStoreAPIDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class ProductFastStoreAPIDataSource: ProductRemoteDataSource {

    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func products() async throws -> [Product] {
        let url = FakeStoreAPIEndpoint.products.url
        let (data, _) = try await urlSession.data(from: url)
        let productDataModels = try JSONDecoder().decode([ProductDataModel].self, from: data)

        let products = productDataModels.map(ProductMapper.map)

        return products
    }

    func products(for categoryID: ProductCategory.ID) async throws -> [Product] {
        let url = FakeStoreAPIEndpoint.productsInCategory(categoryID: categoryID).url
        let (data, _) = try await urlSession.data(from: url)
        let productDataModels = try JSONDecoder().decode([ProductDataModel].self, from: data)

        let products = productDataModels.map(ProductMapper.map)

        return products
    }

    func product(withID id: Product.ID) async throws -> Product? {
        let url = FakeStoreAPIEndpoint.product(id: id).url
        let (data, _) = try await urlSession.data(from: url)
        let productDataModel = try JSONDecoder().decode(ProductDataModel.self, from: data)

        let product = ProductMapper.map(from: productDataModel)

        return product
    }

}
