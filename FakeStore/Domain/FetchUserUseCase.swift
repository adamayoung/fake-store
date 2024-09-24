//
//  FetchUserUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol FetchUserUseCase {

    func execute(username: String) async throws -> User?

}
