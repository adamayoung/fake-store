//
//  ProductDefaultRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class ProductDefaultRepository: ProductRepository {

    private let remoteDataSource: any ProductRemoteDataSource
    private let cacheDataSource: any ProductCacheDataSource

    init(
        remoteDataSource: some ProductRemoteDataSource,
        cacheDataSource: some ProductCacheDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.cacheDataSource = cacheDataSource
    }

    func products() async throws -> [Product] {
        if let cacheProducts = await cacheDataSource.products() {
            return cacheProducts
        }

        let products = try await remoteDataSource.products()
        await cacheDataSource.setProducts(products)

        return products
    }

    func products(for categoryID: ProductCategory.ID) async throws -> [Product] {
        if let cacheProducts = await cacheDataSource.products(for: categoryID) {
            return cacheProducts
        }

        let products = try await remoteDataSource.products(for: categoryID)
        await cacheDataSource.setProducts(products, for: categoryID)

        return products
    }

    func product(withID id: Product.ID) async throws -> Product? {
        if let cachedProduct = await cacheDataSource.product(withID: id) {
            return cachedProduct
        }

        let product = try await remoteDataSource.product(withID: id)
        await cacheDataSource.setProduct(product, withID: id)

        return product
    }

}
