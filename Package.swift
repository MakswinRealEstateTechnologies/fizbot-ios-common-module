// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FizbotCommon",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FizbotCommon",
            targets: ["FizbotCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMinor(from: "3.4.3")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FizbotCommon",
            dependencies: [
                .product(name: "Lottie",
                         package: "lottie-ios")],
            path: "Sources/FizbotCommon"
        )
    ]
)

/*
 
 targets: [
     .target(
         name: "VidovenIOS-SDK",
         dependencies: [
             .product(name: "SocketIO",
                      package: "socket.io-client-swift"),
             .product(name: "Alamofire",
                      package: "Alamofire")],
     path: "Sources/VidovenIOS-SDK")
 ]
 */
