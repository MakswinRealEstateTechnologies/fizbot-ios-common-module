// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FizbotCommon",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "FizbotCommon",
            targets: ["FizbotCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMinor(from: "3.4.3")),
    ],
    targets: [
        .target(
            name: "FizbotCommon",
            dependencies: [
                .product(name: "Lottie",
                         package: "lottie-ios")],
            path: "Sources/FizbotCommon"
        )
    ]
)
