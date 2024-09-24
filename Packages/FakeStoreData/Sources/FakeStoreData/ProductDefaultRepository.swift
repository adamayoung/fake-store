//
//  ProductDefaultRepository.swift
//  FakeStoreData
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class ProductDefaultRepository: ProductRepository {

    private let remoteDataSource: any ProductRemoteDataSource
    private let localDataSource: any ProductLocalDataSource

    init(
        remoteDataSource: some ProductRemoteDataSource,
        localDataSource: some ProductLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func products() async throws -> [Product] {
        if let cacheProducts = await localDataSource.products() {
            return cacheProducts
        }

        let products = try await remoteDataSource.products()
        await localDataSource.setProducts(products)

        return products
    }

    func products(for categoryID: ProductCategory.ID) async throws -> [Product] {
        if let cacheProducts = await localDataSource.products(for: categoryID) {
            return cacheProducts
        }

        let products = try await remoteDataSource.products(for: categoryID)
        await localDataSource.setProducts(products, for: categoryID)

        return products
    }

    func product(withID id: Product.ID) async throws -> Product? {
        if let cachedProduct = await localDataSource.product(withID: id) {
            return cachedProduct
        }

        let product = try await remoteDataSource.product(withID: id)
        await localDataSource.setProduct(product, withID: id)

        return product
    }

}
