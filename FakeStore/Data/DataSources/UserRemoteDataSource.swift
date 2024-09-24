//
//  UserRemoteDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol UserRemoteDataSource {

    func user(withUsername username: String) async throws -> User?

}
