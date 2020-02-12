/**
 *  https://github.com/tadija/AEShell
 *  Copyright © 2020 Marko Tadić
 *  Licensed under the MIT license
 */

import Foundation

public struct Shell {
    public let currentPath: String
    public let launchPath: String

    public init(at currentPath: String = FileManager.default.currentDirectoryPath,
                launch launchPath: String = "/bin/zsh") {
        self.currentPath = currentPath
        self.launchPath = launchPath
    }

    @discardableResult
    public func run(_ commands: String...) throws -> String {
        try run(commands)
    }

    @discardableResult
    public func run(_ commands: [String]) throws -> String {
        try run(commands.joined(separator: " && "))
    }

    @discardableResult
    public func run(_ command: String) throws -> String {
        let process = Process()
        process.currentDirectoryPath = currentPath
        process.launchPath = launchPath
        process.arguments = ["-c", command]

        let outputPipe = Pipe()
        process.standardOutput = outputPipe

        let errorPipe = Pipe()
        process.standardError = errorPipe

        process.launch()
        process.waitUntilExit()

        let output = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let error = errorPipe.fileHandleForReading.readDataToEndOfFile()

        let status = Int(process.terminationStatus)
        switch status {
        case 0:
            return output.toString() ?? ""
        default:
            throw Error(
                status: status,
                message: error,
                output: output
            )
        }
    }

    public struct Error: Swift.Error, LocalizedError {
        public let status: Int
        public let message: Data
        public let output: Data

        public var errorDescription: String? {
            var description = "Status: \(status)\n"
            if let message = message.toString(), !message.isEmpty {
                description += "Message: \(message)\n"
            }
            if let output = output.toString(), !output.isEmpty {
                description += "Output: \(output)\n"
            }
            return description.removingNewLine()
        }
    }
}

// MARK: - Helpers

extension Data {
    func toString(using encoding: String.Encoding = .utf8) -> String? {
        guard let s = String(data: self, encoding: encoding) else {
            return nil
        }
        return s.removingNewLine()
    }
}

extension String {
    func removingNewLine() -> String {
        guard !hasSuffix("\n") else {
            return String(dropLast())
        }
        return self
    }
}
