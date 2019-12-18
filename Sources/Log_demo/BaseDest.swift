//
//  File.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation

public protocol LogDestAble: class, Equatable, Identifiable {
    
    func send(_ level: Log.Level, msg: String, thread: String,
              file: String, function: String, line: Int, context: Any?)
    
}
extension LogDestAble {
    
    
//    public func send(_ level: Log.Level, msg: String, thread: String,
//              file: String, function: String, line: Int, context: Any?) {
//        print("请自行实现接口");
//        assertionFailure("此接口需要默认实现");
//    }
    
    public func format(level: Log.Level, msg: String, thread: String,
                       file: String, function: String, line: Int, context: Any? = nil) -> String {
        // 暂时只使用默认 格式输出：
        let fileExt: String = file.components(separatedBy: "/").last ?? file;
        let text: String = dateText + " " + fileExt + "" + function + ":" + "\(line)" + " " + msg;
        return text;
    }
    
    public var dateText: String {
        let dateFormat = DateFormatter();
        dateFormat.dateFormat = "HH:mm:ss.SSS";
        let dateText: String = dateFormat.string(from: Date());
        return dateText;
    }
    
}

public class BaseDest: Identifiable, LogDestAble {
    public var id: String = UUID().uuidString;
    
    init() { }
    
    public func send(_ level: Log.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any?) {
        
    }
    
}

extension BaseDest: Equatable {
    public static func == (lhs: BaseDest, rhs: BaseDest) -> Bool {
        return lhs.id == rhs.id;
    }
}
