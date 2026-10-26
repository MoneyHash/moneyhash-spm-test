// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoneyHashiOS",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MoneyHashiOS",
            targets: ["MoneyHashiOS"]
        )
    ],
    dependencies: [
        .package(
            name: "MoneyHashCore",
            url: "https://github.com/MoneyHash/core-ios-test-spm.git",
            "0.0.6"..<"1.0.0"
        )
    ],
    targets: [
        .target(
            name: "MoneyHashiOS",
            dependencies: [
                .target(name: "MoneyHash"),
                .product(name: "MoneyHashCore", package: "MoneyHashCore")
            ]
        ),
        .binaryTarget(
            name: "MoneyHash",
            url: "https://github.com/MoneyHash/moneyhash-spm-test/releases/download/0.0.6/MoneyHash.xcframework.zip",
            checksum: "0baa9ac2fe3feb1f19171c7bdb9dcd9a86877884b7bbbac1f04667e92b3538f4"
        )
    ]
)
