//
//  FakeStoreAPIEndpoint.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

enum FakeStoreAPIEndpoint {

    case categories

    case productsInCategory(categoryID: String)
    case product(id: Int)

    case users

    case login

}

extension FakeStoreAPIEndpoint {

    private static let baseURL = URL(string: "https://fakestoreapi.com")!

    var url: URL {
        switch self {
        case .categories:
            Self.baseURL
                .appendingPathComponent("products")
                .appendingPathComponent("categories")

        case let .productsInCategory(categoryID):
            Self.baseURL
                .appendingPathComponent("products")
                .appendingPathComponent("category")
                .appendingPathComponent("\(categoryID)")

        case let .product(id):
            Self.baseURL
                .appendingPathComponent("products")
                .appendingPathComponent("\(id)")

        case .users:
            Self.baseURL
                .appendingPathComponent("users")

        case .login:
            Self.baseURL
                .appendingPathComponent("auth")
                .appendingPathComponent("login")
        }
    }

}
