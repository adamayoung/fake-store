//
//  AccessToken.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public struct AccessToken: Sendable {

    public let value: String

    public init(value: String) {
        self.value = value
    }

}
