//
//  UserLocalDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import FakeStoreDomain
import Foundation

protocol UserLocalDataSource {

    func user(withUsername username: String) async -> User?

    func setUser(_ user: User?, withUsername username: String) async

}
