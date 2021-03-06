// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CompoundFileReader",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CompoundFileReader",
            targets: ["CompoundFileReader"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/hughbe/DataStream", from: "2.0.0"),
        .package(url: "https://github.com/hughbe/WindowsDataTypes", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CompoundFileReader",
            dependencies: ["DataStream", "WindowsDataTypes"]),
        .testTarget(
            name: "CompoundFileReaderTests",
            dependencies: ["CompoundFileReader"],
            resources: [.process("Resources")]),
    ]
)
