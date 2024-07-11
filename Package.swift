// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "RxDataSources",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(name: "RxDataSources", targets: ["RxDataSources"]),
        .library(name: "RxDataSources-Dynamic", type: .dynamic, targets: ["RxDataSources"]),
        .library(name: "Differentiator", targets: ["Differentiator"])
    ],
    dependencies: [
        .package(url: "https://github.com/iruirc/RxSwift.git", exact: "6.7.100")
    ],
    targets: [
        .target(
            name: "RxDataSources",
            dependencies: [
                "Differentiator",
                .product(name: "RxAll-Dynamic", package: "RxSwift")
            ]
        ),
        .target(name: "Differentiator"),
        .testTarget(name: "RxDataSourcesTests", dependencies: ["RxDataSources"])
    ],
    swiftLanguageVersions: [.v5]
)
