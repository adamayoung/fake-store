//
//  CategoryRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol CategoryRepository {

    func categories() async throws -> [ProductCategory]

}
