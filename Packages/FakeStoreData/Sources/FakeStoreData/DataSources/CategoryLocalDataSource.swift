//
//  CategoryLocalDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

protocol CategoryLocalDataSource {

    func categories() async -> [ProductCategory]?

    func setCategories(_ categories: [ProductCategory]) async

}
