// swift-tools-version:5.1

/**
 *  https://github.com/tadija/AEShell
 *  Copyright © 2020 Marko Tadić
 *  Licensed under the MIT license
 */

import PackageDescription

let package = Package(
    name: "AEShell",
    products: [
        .library(
            name: "AEShell",
            targets: ["AEShell"]
        )
    ],
    targets: [
        .target(
            name: "AEShell"
        ),
        .testTarget(
            name: "AEShellTests",
            dependencies: ["AEShell"]
        )
    ]
)
