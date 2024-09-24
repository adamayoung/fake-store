//
//  UserCacheDataSource.swift
//  FakeStore
//
//  Created by Adam Young on 23/09/2024.
//

import Foundation

protocol UserCacheDataSource {

    func user(withUsername username: String) async -> User?

    func setUser(_ user: User?, withUsername username: String) async

}
