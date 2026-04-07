// swift-tools-version:5.5
//
//  Package.swift
//  QumparaSDK
//
//  Swift Package Manager manifest. The same repo is also distributed via
//  CocoaPods (see QumparaSDK.podspec) — both consumers share the same
//  prebuilt xcframework and the same resource bundle.
//

import PackageDescription

let package = Package(
    name: "QumparaSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "QumparaSDK",
            targets: ["QumparaSDKResources", "QumparaSDKBinary"]
        )
    ],
    dependencies: [
        // QumparaAnalyticsSDK is currently distributed as a fat .framework
        // (CocoaPods only). To finish SPM support it needs its own
        // Package.swift exposing an .xcframework binaryTarget. Until that
        // ships, SPM consumers must add QPAnalytics manually OR you must
        // bundle QPAnalytics symbols inside QumparaSDK.xcframework.
        //
        // .package(url: "https://github.com/kokteyldev/QumparaAnalyticsSDK.git", from: "1.0.1"),
    ],
    targets: [
        // 1) Prebuilt static xcframework. SwiftPM treats this as opaque —
        //    it cannot ship its own resources, which is why we need a
        //    sibling source target (#2) to carry QumparaResources.bundle.
        .binaryTarget(
            name: "QumparaSDKBinary",
            path: "QumparaSDK/QumparaSDK.xcframework"
        ),

        // 2) Resource carrier. SwiftPM auto-generates SWIFTPM_MODULE_BUNDLE
        //    for ObjC targets that declare `resources:`, and the SDK reads
        //    nibs/asset catalogs from it via `+[NSBundle qpBundle]`.
        .target(
            name: "QumparaSDKResources",
            dependencies: [
                .target(name: "QumparaSDKBinary")
                // .product(name: "QumparaAnalyticsSDK", package: "QumparaAnalyticsSDK"),
            ],
            path: "Sources/QumparaSDKResources",
            resources: [
                .copy("QumparaResources.bundle")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("WebKit"),
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("c++")
            ]
        )
    ]
)
