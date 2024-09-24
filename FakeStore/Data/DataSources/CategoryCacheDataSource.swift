//
//  CategoryCacheDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol CategoryCacheDataSource {

    func categories() async -> [ProductCategory]?

    func setCategories(_ categories: [ProductCategory]) async

}
