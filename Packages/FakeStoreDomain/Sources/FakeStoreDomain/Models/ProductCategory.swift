//
//  ProductCategory.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct ProductCategory: Identifiable, Sendable, Hashable {

    public let id: String
    public let name: String
    public let imageName: String

    public init(
        id: String,
        name: String,
        imageName: String
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }

}
