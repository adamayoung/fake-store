// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FakeStoreDomain",

    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],

    products: [
        .library(name: "FakeStoreDomain", targets: ["FakeStoreDomain"])
    ],

    targets: [
        .target(
            name: "FakeStoreDomain"
        ),
        .testTarget(
            name: "FakeStoreDomainTests",
            dependencies: ["FakeStoreDomain"]
        )
    ]
)
