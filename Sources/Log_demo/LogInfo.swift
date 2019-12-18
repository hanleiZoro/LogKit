//
//  File 2.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation

public struct LogInfo: Codable, Identifiable {
    public var id: String = UUID().uuidString;
    
    var text: String;
    var level: Log.Level = .verbose;
    
    var date: String //Date = Date();
    var file: String = #file;
    var function: String = #function;
    var line: Int = #line;
    
}
