//
//  ProductDataModel.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

struct ProductDataModel: Decodable {

    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: URL
    let rating: RatingDataModel

}
