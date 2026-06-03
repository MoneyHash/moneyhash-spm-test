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
            path: "../moneyhash-spm"
        ),
        .package(
            name: "MoneyHashCore",
            path: "../moneyhashCore-spm"
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
            path: "Sources/Frameworks/MoneyHash.xcframework"
        )
    ]
)
