# AEShell

**Swift package for running shell commands**

> I made this for personal use, but feel free to use it or contribute.

## Usage

```swift
import AEShell

// current and launch path default to `.currentDirectoryPath` and `/bin/zsh` 
try Shell().run("echo hello world")

// either of which can be changed during the init
try Shell(at: "/tmp", launch: "/bin/bash")
    .run("touch My.swift")
    
// && it's also possible to chain multiple commands
try Shell().run("echo hello", "echo world")
```

## Installation

- [Swift Package Manager](https://swift.org/package-manager/):

    ```swift
    .package(
        url: "https://github.com/tadija/AEShell.git", from: "0.1.0"
    )
    ```

## License
This code is released under the MIT license. See [LICENSE](LICENSE) for details.
