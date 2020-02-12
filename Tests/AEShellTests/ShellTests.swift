import XCTest
@testable import AEShell

final class ShellTests: XCTestCase {

    func testLaunchPath() {
        let shell = Shell(launch: "/bin/bash")
        XCTAssertNoThrow(
            XCTAssertNotEqual(
                try shell.run("echo $BASH_VERSION"),
                ""
            )
        )
    }
    
    func testCurrentPath() {
        let shell = Shell(at: "/tmp")
        XCTAssertNoThrow(
            XCTAssertEqual(
                (try shell.run("pwd")).suffix(4),
                "/tmp"
            )
        )
    }

    func testRunSuccess() {
        XCTAssertNoThrow(
            XCTAssertEqual(
                try Shell().run("echo hello world"),
                "hello world"
            )
        )
    }

    func testRunError() {
        XCTAssertThrowsError(
            try Shell().run("unknown-command-test")
        )
    }

    func testRunCommands() {
        XCTAssertNoThrow(
            XCTAssertEqual(
                try Shell().run(
                    "echo hello",
                    "echo world"
                ),
                "hello\nworld"
            )
        )
    }

    static var allTests = [
        ("testLaunchPath", testLaunchPath),
        ("testCurrentPath", testCurrentPath),
        ("testRunSuccess", testRunSuccess),
        ("testRunError", testRunError),
        ("testRunCommands", testRunCommands),
    ]
    
}
