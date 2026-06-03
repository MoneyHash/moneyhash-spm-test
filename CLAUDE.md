# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the MoneyHash iOS SDK, a Swift Package Manager (SPM) based library that provides iOS integration for MoneyHash's payment orchestration platform. The repository primarily wraps a binary XCFramework with a minimal Swift wrapper.

## Architecture

### Package Structure

The project uses Swift Package Manager with the following architecture:

- **Binary Target**: `MoneyHash.xcframework` located at `Sources/Frameworks/MoneyHash.xcframework`
  - Contains pre-compiled framework for iOS devices (arm64) and simulators (arm64/x86_64)
  - This is the core SDK implementation distributed as a binary

- **Swift Wrapper**: `Sources/MoneyHashiOS/MoneyHashiOS.swift`
  - Minimal wrapper that imports and re-exports the binary framework
  - Currently contains only a public struct placeholder

- **External Dependency**: MoneyHashShared (moneyhash-spm)
  - External SPM package from https://github.com/MoneyHash/moneyhash-spm
  - Current version: 4.0.11
  - Shared code used across MoneyHash SDK implementations

- **Local Dependency**: MoneyHashCore (moneyhashCore-spm)
  - Local SPM package located at `../moneyhashCore-spm`
  - Binary XCFramework providing core MoneyHash functionality
  - Referenced using relative path from this package

### Dependency Chain

```
MoneyHashiOS (this package)
├── MoneyHash (binary XCFramework - local)
├── MoneyHashShared (SPM dependency - remote)
└── MoneyHashCore (SPM dependency - local)
```

## Development Commands

### Prerequisites

Ensure the MoneyHashCore local dependency is available at `../moneyhashCore-spm` relative to this package. The build will fail if this local package is not present.

### Building the Package

```bash
# Build the package
swift build

# Build for release
swift build -c release

# Resolve dependencies
swift package resolve
```

### Opening in Xcode

```bash
# Open the auto-generated workspace
open .swiftpm/xcode/package.xcworkspace
```

The package will be available in Xcode for development, testing, and integration.

## Platform Support

- **Minimum iOS Version**: iOS 11.0
- **Supported Architectures**:
  - Device: arm64
  - Simulator: arm64, x86_64

## Updating the Binary Framework

When updating the `MoneyHash.xcframework`:

1. Replace the entire `Sources/Frameworks/MoneyHash.xcframework` directory with the new version
2. Ensure the new framework maintains the same structure (ios-arm64 and ios-arm64_x86_64-simulator slices)
3. Update the MoneyHashShared dependency version in `Package.swift` if needed
4. Commit with a descriptive message following the pattern: "Update MoneyHash.xcframework and dependency to version X.Y.Z"

## Integration

Consumers of this SDK should refer to the [example implementation](https://github.com/MoneyHash/moneyhash-ios-example) for usage guidance.
