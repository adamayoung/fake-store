//
//  Rating.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct Rating: Sendable, Hashable {

    public let rate: Double
    public let count: Int

    public init(rate: Double, count: Int) {
        self.rate = rate
        self.count = count
    }

}
