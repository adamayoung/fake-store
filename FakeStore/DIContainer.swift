//
//  DIContainer.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class DIContainer {

    static let shared = DIContainer()

    private init() {}

}

extension DIContainer {

    func accountStore() -> AccountStore.Dependencies {
        let signInUseCase = signInUseCase()
        let fetchUserUseCase = fetchUserUseCase()

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
        let searchProductsUseCase = searchProductsUseCase()

        return StoreNavigationViewModel.Dependencies(
            searchProducts: { query in
                try await searchProductsUseCase.execute(query: query)
            }
        )
    }

    func categoryList() -> CategoryListViewModel.Dependencies {
        let fetchCategoriesUseCase = fetchAllCategoriesUseCase()

        return CategoryListViewModel.Dependencies(
            fetchCategories: {
                try await fetchCategoriesUseCase.execute()
            }
        )
    }

    func productList() -> ProductListViewModel.Dependencies {
        let fetchAllProductsByCategoryUseCase = fetchAllProductsByCategoryUseCase()

        return ProductListViewModel.Dependencies(
            fetchProductsByCategory: {
                try await fetchAllProductsByCategoryUseCase.execute()
            }
        )
    }

    func categoryProductList() -> CategoryProductListViewModel.Dependencies {
        let fetchProductsInCategoryUseCase = fetchProductInCategoryUseCase()

        return CategoryProductListViewModel.Dependencies(
            fetchProductsInCategory: { categoryID in
                try await fetchProductsInCategoryUseCase.execute(categoryID: categoryID)
            }
        )
    }

    func productDetails() -> ProductDetailsViewModel.Dependencies {
        let fetchProductUseCase = fetchProductUseCase()

        return ProductDetailsViewModel.Dependencies(
            fetchProduct: { id in
                try await fetchProductUseCase.execute(id: id)
            }
        )
    }

}

extension DIContainer {

    private func fetchAllProductsByCategoryUseCase() -> some FetchAllProductsByCategoryUseCase {
        let repository = productRepository()

        return FetchAllProductsByCategory(repository: repository)
    }

    private func searchProductsUseCase() -> some SearchProductsUseCase {
        let repository = productRepository()

        return SearchProducts(repository: repository)
    }

    private func fetchProductInCategoryUseCase() -> some FetchProductsInCategoryUseCase {
        let repository = productRepository()

        return FetchProductsInCategory(repository: repository)
    }

    private func fetchProductUseCase() -> some FetchProductUseCase {
        let repository = productRepository()

        return FetchProduct(repository: repository)
    }

    private func fetchAllCategoriesUseCase() -> some FetchAllCategoriesUseCase {
        let repository = categoryRepository()

        return FetchAllCategories(repository: repository)
    }

    private func signInUseCase() -> some SignInUseCase {
        let repository = authenticationRepository()

        return SignIn(repository: repository)
    }

    private func fetchUserUseCase() -> some FetchUserUseCase {
        let repository = userRepository()

        return FetchUser(repository: repository)
    }

}

extension DIContainer {

    private func productRepository() -> some ProductRepository {
        let remoteDataSource = productRemoteDataSource()
        let cacheDataSource = productCacheDataSource()

        return ProductDefaultRepository(remoteDataSource: remoteDataSource, cacheDataSource: cacheDataSource)
    }

    private func categoryRepository() -> some CategoryRepository {
        let remoteDataSource = categoryRemoteDataSource()
        let cacheDataSource = categoryCacheDataSource()

        return CategoryDefaultRepository(remoteDataSource: remoteDataSource, cacheDataSource: cacheDataSource)
    }

    private func authenticationRepository() -> some AuthenticationRepository {
        let remoteDataSource = authenticationRemoteDataSource()

        return AuthenticationDefaultRepository(remoteDataSource: remoteDataSource)
    }

    private func userRepository() -> some UserRepository {
        let remoteDataSource = userRemoteDataSource()
        let cacheDataSource = userCacheDataSource()

        return UserDefaultRepository(remoteDataSource: remoteDataSource, cacheDataSource: cacheDataSource)
    }

}

extension DIContainer {

    private func categoryRemoteDataSource() -> some CategoryRemoteDataSource {
        CategoryFastStoreAPIDataSource(urlSession: Self.urlSession)
    }

    private func categoryCacheDataSource() -> some CategoryCacheDataSource {
        CategoryCacheStoreDataSource(cache: Self.cacheStore)
    }

    private func productRemoteDataSource() -> some ProductRemoteDataSource {
        ProductFastStoreAPIDataSource(urlSession: Self.urlSession)
    }

    private func productCacheDataSource() -> some ProductCacheDataSource {
        ProductCacheStoreDataSource(cache: Self.cacheStore)
    }

    private func userRemoteDataSource() -> some UserRemoteDataSource {
        UserFastStoreAPIDataSource(urlSession: Self.urlSession)
    }

    private func userCacheDataSource() -> some UserCacheDataSource {
        UserCacheStoreDataSource(cache: Self.cacheStore)
    }

    private func authenticationRemoteDataSource() -> some AuthenticationRemoteDataSource {
        AuthenticationFastStoreAPIDataSource(urlSession: Self.urlSession)
    }

}

extension DIContainer {

    private static let urlSession: URLSession = .shared

    private static let cacheStore: some CacheStore = CacheInMemoryStore()

}
