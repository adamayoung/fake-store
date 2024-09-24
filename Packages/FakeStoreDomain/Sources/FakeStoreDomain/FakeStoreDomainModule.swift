//
//  FakeStoreDomainModule.swift
//  FakeStoreDomain
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

public class FakeStoreDomainModule {

    public struct Dependencies {

        let authenticationRepository: @Sendable () -> any AuthenticationRepository
        let categoryRepository: @Sendable () -> any CategoryRepository
        let productRepository: @Sendable () -> any ProductRepository
        let userRepository: @Sendable () -> any UserRepository

        public init(
            authenticationRepository: @Sendable @escaping () -> some AuthenticationRepository,
            categoryRepository: @Sendable @escaping () -> some CategoryRepository,
            productRepository: @Sendable @escaping () -> some ProductRepository,
            userRepository: @Sendable @escaping () -> some UserRepository
        ) {
            self.authenticationRepository = authenticationRepository
            self.categoryRepository = categoryRepository
            self.productRepository = productRepository
            self.userRepository = userRepository
        }

    }

    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func fetchAllProductsByCategoryUseCase() -> some FetchAllProductsByCategoryUseCase {
        let repository = dependencies.productRepository()

        return FetchAllProductsByCategory(repository: repository)
    }

    public func searchProductsUseCase() -> some SearchProductsUseCase {
        let repository = dependencies.productRepository()

        return SearchProducts(repository: repository)
    }

    public func fetchProductInCategoryUseCase() -> some FetchProductsInCategoryUseCase {
        let repository = dependencies.productRepository()

        return FetchProductsInCategory(repository: repository)
    }

    public func fetchProductUseCase() -> some FetchProductUseCase {
        let repository = dependencies.productRepository()

        return FetchProduct(repository: repository)
    }

    public func fetchAllCategoriesUseCase() -> some FetchAllCategoriesUseCase {
        let repository = dependencies.categoryRepository()

        return FetchAllCategories(repository: repository)
    }

    public func signInUseCase() -> some SignInUseCase {
        let repository = dependencies.authenticationRepository()

        return SignIn(repository: repository)
    }

    public func fetchUserUseCase() -> some FetchUserUseCase {
        let repository = dependencies.userRepository()

        return FetchUser(repository: repository)
    }

}
