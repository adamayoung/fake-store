//
//  RatingMapper.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

struct RatingMapper {

    private init() {}

    static func map(from dataModel: RatingDataModel) -> Rating {
        Rating(
            rate: dataModel.rate,
            count: dataModel.count
        )
    }

}
