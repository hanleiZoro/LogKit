//
//  File.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation

public class FileDest: BaseDest {
    
    var fileHandle: FileHandle?
    var logFileURL: URL?
    let fileManager = FileManager.default;
    var syncAfterEachWrite = false;
    
    override init() {
        let baseURL: URL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!;
        logFileURL = baseURL.appendingPathComponent("Console.log");
        print("打印当前存储地址：\(logFileURL)");
        super.init();
    }
    
    public override func send(_ level: Log.Level, msg: String, thread: String, file: String, function: String, line: Int, context: Any? = nil) {
        let formatText: String = format(level: level, msg: msg, thread: thread, file: file, function: function, line: line);
        
        _ = saveToFile(str: formatText);
    }
    
    func saveToFile(str: String) -> Bool {
        guard let url = logFileURL else { return false }
        do {
            if fileManager.fileExists(atPath: url.path) == false {
                let directoryURL = url.deletingLastPathComponent()
                if fileManager.fileExists(atPath: directoryURL.path) == false {
                    try fileManager.createDirectory(
                        at: directoryURL,
                        withIntermediateDirectories: true
                    )
                }
                // create file if not existing
                let line = str + "\n"
                try line.write(to: url, atomically: true, encoding: .utf8)

                if #available(iOS 10.0, watchOS 3.0, *) {
                    var attributes = try fileManager.attributesOfItem(atPath: url.path)
                    attributes[FileAttributeKey.protectionKey] = FileProtectionType.none
                    try fileManager.setAttributes(attributes, ofItemAtPath: url.path)
                }
            } else {
                // append to end of file
                if fileHandle == nil {
                    // initial setting of file handle
                    fileHandle = try FileHandle(forWritingTo: url as URL)
                }
                if let fileHandle = fileHandle {
                    _ = fileHandle.seekToEndOfFile()
                    let line = str + "\n"
                    if let data = line.data(using: String.Encoding.utf8) {
                        fileHandle.write(data)
                        if syncAfterEachWrite {
                            fileHandle.synchronizeFile()
                        }
                    }
                }
            }
            return true
        } catch {
            print("Log File Destination could not write to file \(url).");
            return false
        }
    }
    
}
