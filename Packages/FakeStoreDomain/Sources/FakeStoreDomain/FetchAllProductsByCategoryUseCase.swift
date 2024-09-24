//
//  FetchAllProductsByCategoryUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 24/09/2024.
//

import Foundation

public protocol FetchAllProductsByCategoryUseCase {

    func execute() async throws -> [ProductCategoryGroup]

}
