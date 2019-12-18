import Foundation

struct Log_demo {
    var text = "Hello, World!"
}



public class Log  {
    
    private(set) static var destList: [BaseDest] = []
//    private var logDate: Date?
    
    public static func addDest(dest: BaseDest) {
        destList.append(dest);
    }
    public static func removeDest(dest: BaseDest) {
        if let index = destList.firstIndex(of: dest) {
            destList.remove(at: index);
        }
    }
    
    static let thread = DispatchQueue.init(label: "com.log.queue");
    
    static let `default` = Log();
    static var format = DateFormatter();
    
    public enum Level: Int, Codable {
        case verbose = 0
        case debug = 1
        case info = 2
        case warnning = 3
        case error = 4
        
        public var description: String {
            switch self {
            case .verbose:
                return "VERBOSE";
            case .debug:
                return "DEBUG";
            case .info:
                return "INFO";
            case .warnning:
                return "WARNNING";
            case .error:
                return "ERROR"
            }
        }
    }
    
    public static func debug( text: String, file: String = #file, function: String = #function, line: Int = #line) {
//        print("[\(title)] \(text)")
        destList.forEach { (dest) in
            dest.send(Level.debug, msg: text, thread: thread.label, file: file, function: function, line: line, context: nil)
        }
    }
    
    public static func verbose(title: String = Level.verbose.description, text: String, file: String = #file, function: String = #function, line: Int = #line) {
        destList.forEach { (dest) in
            dest.send(Level.verbose, msg: text, thread: thread.label, file: file, function: function, line: line, context: nil)
        }
    }
    
    public static func info(title: String = Level.info.description, text: String, file: String = #file, function: String = #function, line: Int = #line) {
//        print("[\(title)] \(text)")
        destList.forEach { (dest) in
            dest.send(Level.info, msg: text, thread: thread.label, file: file, function: function, line: line, context: nil)
        }
    }
    
    public static func warnning(title: String = Level.warnning.description, text: String, file: String = #file, function: String = #function, line: Int = #line) {
//        print("[\(title)] \(text)")
        destList.forEach { (dest) in
            dest.send(Level.warnning, msg: text, thread: thread.label, file: file, function: function, line: line, context: nil)
        }
    }
    
    public static func error(title: String = Level.error.description, text: String, file: String = #file, function: String = #function, line: Int = #line) {
//        print("[\(title)] \(text)")
        destList.forEach { (dest) in
            dest.send(Level.error, msg: text, thread: thread.label, file: file, function: function, line: line, context: nil)
        }
    }
    
}
