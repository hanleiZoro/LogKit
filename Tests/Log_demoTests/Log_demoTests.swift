import XCTest
@testable import Log_demo

final class Log_demoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Log_demo().text, "Hello, World!")
        
        Log.addDest(dest: FileDest());
        Log.addDest(dest: ConsoleDest());
        Log.addDest(dest: ScreenDest());
        
        Display.default.window?.makeKeyAndVisible()
//        XCTAssert(Log.destList.count == 2, "Log.destList 应该含有2个数据")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            Log.debug(text: "第一条测试惜");
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            Log.info(text: "证明当前日志输出信息可用");
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
            Log.verbose(text: "繁琐的内容细节");
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 15) {
            Log.warnning(text: "出现警告❗️");
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20) {
            Log.error(text: "出现错误");
        }
        
        
        let untilDate = Date().addingTimeInterval(60);
        RunLoop.current.run(until: untilDate)
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
