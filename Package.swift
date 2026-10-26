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
            "0.0.6-beta.4"..<"1.0.0"
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
            url: "https://github.com/MoneyHash/moneyhash-spm-test/releases/download/0.0.6-beta.1/MoneyHash.xcframework.zip",
            checksum: "9d1f98dc6956f28176da8b7d98e7d3b3843ab2d079a79242207b013f592c4d1e"
        )
    ]
)
