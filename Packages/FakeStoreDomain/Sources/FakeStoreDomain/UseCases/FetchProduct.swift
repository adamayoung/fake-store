//
//  FetchProduct.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

final class FetchProduct: FetchProductUseCase {

    private let repository: any ProductRepository

    init(repository: some ProductRepository) {
        self.repository = repository
    }

    func execute(id: Product.ID) async throws -> Product? {
        let product = try await repository.product(withID: id)

        return product
    }

}
