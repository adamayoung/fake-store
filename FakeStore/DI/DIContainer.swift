//
//  DIContainer.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import CachingStore
import FakeStoreData
import FakeStoreDomain
import Foundation

final class DIContainer {

    static let shared = DIContainer()

    private lazy var dataModule: FakeStoreDataModule = .init(
        dependencies: FakeStoreDataModule.Dependencies(
            urlSession: {
                Self.urlSession
            },
            cache: {
                self.cacheStoreAdapter()
            }
        )
    )

    private lazy var domainModule: FakeStoreDomainModule = .init(
        dependencies: FakeStoreDomainModule.Dependencies(
            authenticationRepository: {
                self.dataModule.authenticationRepository()
            },
            categoryRepository: {
                self.dataModule.categoryRepository()
            },
            productRepository: {
                self.dataModule.productRepository()
            },
            userRepository: {
                self.dataModule.userRepository()
            }
        )
    )

    private init() {}

}

extension DIContainer {

    func accountStore() -> AccountStore.Dependencies {
        let signInUseCase = domainModule.signInUseCase()
        let fetchUserUseCase = domainModule.fetchUserUseCase()

        return AccountStore.Dependencies(
            signIn: { credential in
                try await signInUseCase.execute(credential: credential)
            },
            fetchUser: { username in
                try await fetchUserUseCase.execute(username: username)
            }
        )
    }

}

extension DIContainer {

    func storeNavigation() -> StoreNavigationViewModel.Dependencies {
        let searchProductsUseCase = domainModule.searchProductsUseCase()

        return StoreNavigationViewModel.Dependencies(
            searchProducts: { query in
                try await searchProductsUseCase.execute(query: query)
            }
        )
    }

    func categoryList() -> CategoryListViewModel.Dependencies {
        let fetchCategoriesUseCase = domainModule.fetchAllCategoriesUseCase()

        return CategoryListViewModel.Dependencies(
            fetchCategories: {
                try await fetchCategoriesUseCase.execute()
            }
        )
    }

    func productList() -> ProductListViewModel.Dependencies {
        let fetchAllProductsByCategoryUseCase = domainModule.fetchAllProductsByCategoryUseCase()

        return ProductListViewModel.Dependencies(
            fetchProductsByCategory: {
                try await fetchAllProductsByCategoryUseCase.execute()
            }
        )
    }

    func categoryProductList() -> CategoryProductListViewModel.Dependencies {
        let fetchProductsInCategoryUseCase = domainModule.fetchProductInCategoryUseCase()

        return CategoryProductListViewModel.Dependencies(
            fetchProductsInCategory: { categoryID in
                try await fetchProductsInCategoryUseCase.execute(categoryID: categoryID)
            }
        )
    }

    func productDetails() -> ProductDetailsViewModel.Dependencies {
        let fetchProductUseCase = domainModule.fetchProductUseCase()

        return ProductDetailsViewModel.Dependencies(
            fetchProduct: { id in
                try await fetchProductUseCase.execute(id: id)
            }
        )
    }

}

extension DIContainer {

    private func cacheStoreAdapter() -> FakeStoreData.Cache {
        FakeStoreDataCacheAdapter(cache: Self.cacheStore)
    }
}

extension DIContainer {

    private static let urlSession: URLSession = .shared

    private static let cacheStore: some CachingStore.KeyValueCache = CachingStore.KeyValueInMemoryCache()

}
