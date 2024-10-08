//
//  UserRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

public protocol UserRepository {

    func user(withUsername username: String) async throws -> User?

}
