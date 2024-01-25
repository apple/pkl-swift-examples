// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "pkl-swift-examples",
    platforms: [
        .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        .package(url: "https://github.com/apple/pkl-swift", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "Gen",
            dependencies: [.product(name: "PklSwift", package: "pkl-swift")]
        ),
        .executableTarget(
            name: "App",
            dependencies: [
                "Gen",
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            "Gen",
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),

            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
        ]),
    ]
)
