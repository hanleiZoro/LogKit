//
//  File.swift
//  
//
//  Created by 韩雷 on 2019/12/18.
//

import Foundation

public class ScreenDest: BaseDest {
    
    static let `default` = ScreenDest();
    
    var data: [LogInfo] = [];
    public override func send(_ level: Log.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any?) {
        
//        text = format(level: level, msg: msg, thread: thread, file: file, function: function, line: line);
        let info = LogInfo(text: msg, level: level, date: dateText, file: file, function: function, line: line)
        data.append(info);
        NotificationCenter.default.post(name: Self.displayLog, object: self);
    }
    
    public static let displayLog: Notification.Name = Notification.Name.init("Log_screenDisplay");
    
}
