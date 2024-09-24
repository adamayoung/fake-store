//
//  ProductLocalDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

protocol ProductLocalDataSource {

    func products() async -> [Product]?

    func setProducts(_ products: [Product]) async

    func products(for categoryID: ProductCategory.ID) async -> [Product]?

    func setProducts(_ products: [Product], for categoryID: ProductCategory.ID) async

    func product(withID id: Product.ID) async -> Product?

    func setProduct(_ product: Product?, withID id: Product.ID) async

}
