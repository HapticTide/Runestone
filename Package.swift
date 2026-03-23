// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Runestone",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Runestone", targets: ["Runestone"]),
        .library(name: "RunestoneLanguageSupport", targets: ["RunestoneLanguageSupport"])
    ],
    dependencies: [
        .package(url: "https://github.com/tree-sitter/tree-sitter", .upToNextMinor(from: "0.20.9")),
        .package(url: "https://github.com/HapticTide/TreeSitterLanguages.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "Runestone", dependencies: [
            .product(name: "TreeSitter", package: "tree-sitter")
        ], resources: [
            .copy("PrivacyInfo.xcprivacy"),
            .process("TextView/Appearance/Theme.xcassets")
        ]),
        .target(name: "RunestoneLanguageSupport", dependencies: [
            .product(name: "TreeSitterAstroRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterBashRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterCommentRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterCPPRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterCRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterCSharpRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterCSSRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterElixirRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterElmRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterGoRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterHaskellRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterHTMLRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJavaRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJavaScriptRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJSDocRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJSON5Runestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJSONRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterJuliaRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterLaTeXRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterLuaRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterMarkdownInlineRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterMarkdownRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterOCamlRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterPerlRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterPHPRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterPythonRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterRegexQueries", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterRegexRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterRRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterRubyRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterRustRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterSCSSRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterSQLRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterSvelteRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterSwiftRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterTOMLRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterTSXRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterTypeScriptRunestone", package: "TreeSitterLanguages"),
            .product(name: "TreeSitterYAMLRunestone", package: "TreeSitterLanguages"),
        ]),
        .target(name: "TestTreeSitterLanguages", cSettings: [
            .unsafeFlags(["-w"])
        ]),
        .testTarget(name: "RunestoneTests", dependencies: [
            "Runestone",
            "TestTreeSitterLanguages"
        ])
    ]
)
