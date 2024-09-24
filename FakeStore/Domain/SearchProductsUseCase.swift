//
//  SearchProductsUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

protocol SearchProductsUseCase {

    func execute(query: String) async throws -> [Product]

}
