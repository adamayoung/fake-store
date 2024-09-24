//
//  SignInUseCase.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol SignInUseCase {

    func execute(credential: SignInCredential) async throws -> AccessToken

}
