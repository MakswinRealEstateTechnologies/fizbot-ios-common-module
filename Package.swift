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
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.2.1"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit.git", from: "3.4.10"),
    ],
    targets: [
        .target(
            name: "FizbotCommon",
            dependencies: [
                .product(name: "Lottie",
                         package: "lottie-ios"),
                .product(name: "SDWebImageSwiftUI",
                         package: "SDWebImageSwiftUI"),
                .product(name: "PhoneNumberKit",
                         package: "PhoneNumberKit")
            ],
            path: "Sources/FizbotCommon"
        )
    ]
)
