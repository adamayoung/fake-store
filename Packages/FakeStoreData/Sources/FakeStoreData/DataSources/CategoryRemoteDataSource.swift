//
//  CategoryRemoteDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

protocol CategoryRemoteDataSource {

    func categories() async throws -> [ProductCategory]

}
