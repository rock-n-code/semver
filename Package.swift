// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SemVer",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .macCatalyst(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "SemVer",
            targets: [
                "SemVer"
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SemVer",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "SemVerTests",
            dependencies: [
                "SemVer"
            ],
            path: "Tests"
        ),
    ]
)
