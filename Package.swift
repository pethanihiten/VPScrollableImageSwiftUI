// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "VPScrollableImage",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "VPScrollableImage",
            targets: ["VPScrollableImage"]),
    ],
    dependencies: [
        // Declare external package dependencies here
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "VPScrollableImage",
            dependencies: [
                "SDWebImageSwiftUI"
            ]),
        .testTarget(
            name: "VPScrollableImageTests",
            dependencies: ["VPScrollableImage"]),
    ]
)
