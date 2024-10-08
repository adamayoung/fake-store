//
//  ProductCacheStoreDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

final class ProductCacheStoreDataSource: ProductLocalDataSource {

    private let cache: any Cache

    init(cache: some Cache) {
        self.cache = cache
    }

    func products() async -> [Product]? {
        await cache.get(forKey: CacheKey.products)
    }

    func setProducts(_ products: [Product]) async {
        await cache.set(products, forKey: CacheKey.products)
        for product in products {
            await setProduct(product, withID: product.id)
        }
    }

    func products(for categoryID: ProductCategory.ID) async -> [Product]? {
        await cache.get(forKey: CacheKey.products(forCategory: categoryID))
    }

    func setProducts(_ products: [Product], for categoryID: ProductCategory.ID) async {
        await cache.set(products, forKey: CacheKey.products(forCategory: categoryID))
        for product in products {
            await setProduct(product, withID: product.id)
        }
    }

    func product(withID id: Product.ID) async -> Product? {
        await cache.get(forKey: CacheKey.product(withID: id))
    }

    func setProduct(_ product: Product?, withID id: Product.ID) async {
        await cache.set(product, forKey: CacheKey.product(withID: id))
    }

}

extension ProductCacheStoreDataSource {

    private enum CacheKey {

        static var products: String {
            "products"
        }

        static func products(forCategory categoryID: ProductCategory.ID) -> String {
            "products-category-\(categoryID)"
        }

        static func product(withID id: Product.ID) -> String {
            "product-\(id)"
        }

    }

}
