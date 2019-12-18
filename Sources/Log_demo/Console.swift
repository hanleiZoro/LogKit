//
//  File 2.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation
import UIKit


private let reuseID = "ConsoleTable_reuseID"
public class ConsoleViewController: UITableViewController {
    
    var data: [LogInfo] = []
    var screenDest: ScreenDest {
        ScreenDest.default
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad();
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseID);
        NotificationCenter.default.addObserver(self, selector: #selector(displayLogUpdate(_:)), name: ScreenDest.displayLog, object: nil);
    }
    
    @objc func displayLogUpdate(_ noti: Notification) {
        
//        if #available(iOS 13, *) {
//            let diff = screenDest.data.difference(from: data) { (item, info) -> Bool in
//                return item.id == info.id;
//            }
        let index = screenDest.data.count - 1;
        let indexPath = IndexPath(row: index, section: 0);
            tableView.beginUpdates();
        
        tableView.insertRows(at: [indexPath], with: .automatic);
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true);
            tableView.endUpdates();
//        } else {
//            // Fallback on earlier versions
//        }
    }
}
extension ConsoleViewController {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath);
        let info: LogInfo = data[indexPath.row];
        cell.textLabel?.text = "\(info.level)" + info.text;
        return cell;
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("当前没有额外显示器，如果有大屏幕显示器将显示详细内容");
        
    }
}


