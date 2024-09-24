// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakeStoreData",

    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],

    products: [
        .library(name: "FakeStoreData", targets: ["FakeStoreData"])
    ],

    dependencies: [
        .package(name: "FakeStoreDomain", path: "../FakeStoreDomain"),
        .package(name: "CachingStore", path: "../CachingStore")
    ],

    targets: [
        .target(name: "FakeStoreData", dependencies: ["FakeStoreDomain", "CachingStore"]),
        .testTarget(name: "FakeStoreDataTests", dependencies: ["FakeStoreData"])
    ]
)
