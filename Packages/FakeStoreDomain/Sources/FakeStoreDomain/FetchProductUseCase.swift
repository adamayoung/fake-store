//
//  FetchProductUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public protocol FetchProductUseCase {

    func execute(id: Product.ID) async throws -> Product?

}
