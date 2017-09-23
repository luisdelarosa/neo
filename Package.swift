// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "neo",
    dependencies: [
        .Package(url: "https://github.com/uraimo/WS281x.swift.git", majorVersion: 1)
    ]
)
