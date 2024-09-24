//
//  ProductRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol ProductRepository {

    func products(for categoryID: ProductCategory.ID) async throws -> [Product]

    func product(withID id: Product.ID) async throws -> Product?

}
