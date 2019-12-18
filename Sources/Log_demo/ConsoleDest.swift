//
//  File.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation

class ConsoleDest: BaseDest {
    
    override init() {
        super.init();
        
        levelColor.verbose = "💜 "     // silver
        levelColor.debug = "💚 "        // green
        levelColor.info = "💙 "         // blue
        levelColor.warning = "💛 "     // yellow
        levelColor.error = "❤️ "       // red
    }
    
    override func send(_ level: Log.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any? = nil) {
        var formatText: String = format(level: level, msg: msg, thread: thread, file: file, function: function, line: line);
        formatText = colorForLevel(level) + formatText;
        print(formatText);
    }
    
    public var levelColor = LevelColor();
    
    public struct LevelColor {
        public var verbose = ""     // silver
        public var debug   = ""     // green
        public var info    = ""     // blue
        public var warning = ""     // yellow
        public var error   = ""     // red
    }
    /// returns color string for level
    func colorForLevel(_ level: Log.Level) -> String {
        var color = ""
        
        switch level {
        case .debug:
            color = levelColor.debug
            
        case .info:
            color = levelColor.info
            
        case .warnning:
            color = levelColor.warning
            
        case .error:
            color = levelColor.error
            
        default:
            color = levelColor.verbose
        }
        return color
    }
}

