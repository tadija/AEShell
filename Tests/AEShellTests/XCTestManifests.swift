#if !canImport(ObjectiveC)
import XCTest

extension ShellTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ShellTests = [
        ("testCurrentPath", testCurrentPath),
        ("testLaunchPath", testLaunchPath),
        ("testRunCommands", testRunCommands),
        ("testRunError", testRunError),
        ("testRunSuccess", testRunSuccess),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ShellTests.__allTests__ShellTests),
    ]
}
#endif