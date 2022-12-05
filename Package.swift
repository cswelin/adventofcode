
// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Advent of Code",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(name: "advent", targets: ["advent"]),
        .library(name: "AOC", targets: ["AOC"]),
        .library(name: "AOCCore", targets: ["AOCCore"]),
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-algorithms.git", from: "1.0.0"),
        .package(url: "git@github.com:apple/swift-collections.git", from: "1.0.2"),
    ],
    targets: [
        .executableTarget(name: "advent", dependencies: ["AOC"]),
        .target(
            name: "AOC",
            dependencies: [
                "AOCCore",
                "Year2021",
                "Year2022"
            ]
        ),
        .target(name: "Year2021", dependencies: ["AOCCore"], path: "Sources/Year2021"),
        .target(name: "Year2022", dependencies: ["AOCCore"], path: "Sources/Year2022"),
        .target(
            name: "AOCCore",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections")
            ],
            path: "Sources/AOCCore"
        ),
        .testTarget(name: "AOCCoreTests", dependencies: ["AOCCore"]),
        .testTarget(name: "AOCTests", dependencies: ["AOC"])
    ]
)
