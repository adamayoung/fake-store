//
//  FakeStoreDataModule.swift
//  FakeStoreData
//
//  Created by Adam Young on 24/09/2024.
//

import FakeStoreDomain
import Foundation

public final class FakeStoreDataModule {

    public struct Dependencies {

        let urlSession: @Sendable () -> URLSession
        let cache: @Sendable () -> any Cache

        public init(
            urlSession: @Sendable @escaping () -> URLSession,
            cache: @Sendable @escaping () -> any Cache
        ) {
            self.urlSession = urlSession
            self.cache = cache
        }

    }

    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    public func authenticationRepository() -> some AuthenticationRepository {
        let authenticationRemoteDataSource = authenticationRemoteDataSource()

        return AuthenticationDefaultRepository(remoteDataSource: authenticationRemoteDataSource)
    }

    public func categoryRepository() -> some CategoryRepository {
        let categoryRemoteDataSource = categoryRemoteDataSource()
        let categoryLocalDataSource = catergoryLocalDataSource()

        return CategoryDefaultRepository(
            remoteDataSource: categoryRemoteDataSource,
            localDataSource: categoryLocalDataSource
        )
    }

    public func productRepository() -> some ProductRepository {
        let productRemoteDataSource = productRemoteDataSource()
        let productLocalDataSource = productLocalDataSource()

        return ProductDefaultRepository(
            remoteDataSource: productRemoteDataSource,
            localDataSource: productLocalDataSource
        )
    }

    public func userRepository() -> some UserRepository {
        let userRemoteDataSource = userRemoteDataSource()
        let userLocalDataSource = userLocalDataSource()

        return UserDefaultRepository(
            remoteDataSource: userRemoteDataSource,
            localDataSource: userLocalDataSource
        )
    }

}

extension FakeStoreDataModule {

    private func authenticationRemoteDataSource() -> some AuthenticationRemoteDataSource {
        AuthenticationFastStoreAPIDataSource(urlSession: dependencies.urlSession())
    }

}

extension FakeStoreDataModule {

    private func categoryRemoteDataSource() -> some CategoryRemoteDataSource {
        CategoryFastStoreAPIDataSource(urlSession: dependencies.urlSession())
    }

    private func catergoryLocalDataSource() -> some CategoryLocalDataSource {
        CategoryCacheStoreDataSource(cache: dependencies.cache())
    }

}

extension FakeStoreDataModule {

    private func productRemoteDataSource() -> some ProductRemoteDataSource {
        ProductFastStoreAPIDataSource(urlSession: dependencies.urlSession())
    }

    private func productLocalDataSource() -> some ProductLocalDataSource {
        ProductCacheStoreDataSource(cache: dependencies.cache())
    }

}

extension FakeStoreDataModule {

    private func userRemoteDataSource() -> some UserRemoteDataSource {
        UserFastStoreAPIDataSource(urlSession: dependencies.urlSession())
    }

    private func userLocalDataSource() -> some UserLocalDataSource {
        UserCacheStoreDataSource(cache: dependencies.cache())
    }

}
