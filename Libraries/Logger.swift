//
//  Logger.swift
//
//
//  Created by MECHIN on 19/7/2561 BE.
//  Copyright © 2561 MECHIN All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    case error = 0
    case warning = 1
    case debug = 2
    case info = 3
    case verbose = 4
    
    var prefix: String {
        switch self {
        case .error:
            return "💔💔"
            
        case .warning:
            return "💛💛"
            
        case .debug:
            return "💚💚"
            
        case .info:
            return "💙💙"
            
        case .verbose:
            return "💜💜"
        }
    }
}

fileprivate class Logger {
    
    static let shared = Logger()
    
    var minLogLevel: LogLevel = .verbose
    
    let queue = DispatchQueue(label: "Logger.log")
    
    lazy var dateFormatter = ISO8601DateFormatter()
    
    public func custom(_ items: [Any], level: LogLevel = LogLevel.verbose, file: String, function: String, line: Int) {
        
        #if DEBUG
        if self.minLogLevel.rawValue >= level.rawValue {
            let prefix = level.prefix
            let date = dateFormatter.string(from: Date())
            let fileName = file.components(separatedBy: "/").last!
            
            let prefixStr = ("\(prefix) \(date) \(fileName):\(line) ")
            let itemStr = items.map { String(describing: $0) }.joined(separator: " ")
            queue.async {
                Swift.print(prefixStr, separator: "", terminator: " ")
                Swift.print(itemStr, separator: "", terminator: "\n")
            }
        }
        #endif
    }
}

public enum Log {
    
    public static func setMinLogLevel(_ minLogLevel: LogLevel) {
        Logger.shared.minLogLevel = minLogLevel
    }
    
    public static func error(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        Logger.shared.custom(items, level: LogLevel.error, file: file, function: function, line: line)
    }
    
    public static func warning(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        Logger.shared.custom(items, level: LogLevel.warning, file: file, function: function, line: line)
    }
    
    public static func debug(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        Logger.shared.custom(items, level: LogLevel.debug, file: file, function: function, line: line)
    }
    
    public static func info(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        Logger.shared.custom(items, level: LogLevel.info, file: file, function: function, line: line)
    }
    
    public static func verbose(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        Logger.shared.custom(items, level: LogLevel.verbose, file: file, function: function, line: line)
    }
    
}
