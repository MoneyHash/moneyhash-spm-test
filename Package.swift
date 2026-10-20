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
            name: "MoneyHashShared",
            url: "https://github.com/MoneyHash/kmm-test-spm.git",
            .exact("0.0.6-beta.3")
        ),
        .package(
            name: "MoneyHashCore",
            url: "https://github.com/MoneyHash/core-ios-test-spm.git",
            .exact("0.0.4-beta.3")
        )
    ],
    targets: [
        .target(
            name: "MoneyHashiOS",
            dependencies: [
                .target(name: "MoneyHash"),
                .product(name: "MoneyHashShared", package: "MoneyHashShared"),
                .product(name: "MoneyHashCore", package: "MoneyHashCore")
            ]
        ),
        .binaryTarget(
            name: "MoneyHash",
            url: "https://github.com/MoneyHash/moneyhash-spm-test/releases/download/0.0.3-beta.3/MoneyHash.xcframework.zip",
            checksum: "1dfc30f321496949b37c31026b5137c2b5c7aaaced8340a021f182bb4b8176e0"
        )
    ]
)
