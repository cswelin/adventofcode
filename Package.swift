
// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Advent of Code",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "Advent", targets: ["Advent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Advent",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            path: "Advent/Sources"),

        .testTarget(
            name: "AdventTests",
            dependencies: ["Advent"],
            path: "Advent/Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
