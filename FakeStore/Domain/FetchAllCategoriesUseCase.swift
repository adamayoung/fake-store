//
//  FetchAllCategoriesUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol FetchAllCategoriesUseCase {

    func execute() async throws -> [ProductCategory]

}
