// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "AaDS",
    products: [
        .library(name: "AaDS", targets: ["AaDS"]),
    ],
    targets: [
        .target(name: "AaDS"),
        .testTarget(name: "AaDSTests", dependencies: ["AaDS"]),
    ]
)
