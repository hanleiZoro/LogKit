//
//  File.swift
//  
//
//  Created by 韩雷 on 2019/12/18.
//

import Foundation

public class JsonDest: BaseDest {
    public override init() { }
    override func send(_ level: Log.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any?) {
        
        let dic: [String: Any] = [
            "level": level.description,
            "date": dateText,
            "file": file,
            "function": function,
            "line": line,
            "message": msg,
            "thread": thread
        ];
    }
    
}
