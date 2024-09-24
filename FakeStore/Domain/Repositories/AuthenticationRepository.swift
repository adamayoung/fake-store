//
//  AuthenticationRepository.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol AuthenticationRepository {

    func authenticate(credential: SignInCredential) async throws -> AccessToken

}
