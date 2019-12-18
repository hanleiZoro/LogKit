//
//  File 2.swift
//  
//
//  Created by 韩雷 on 2019/12/16.
//

import Foundation
import UIKit

public class Display {
    public init() { }
    static let `default` = Display()
    var window: UIWindow?
    var viewController: ConsoleViewController? {
        return self.window?.rootViewController as? ConsoleViewController;
    }
    
    func setup() {
        let notiC = NotificationCenter.default;
        notiC.addObserver(self, selector: #selector(didConenectScreen(noti:)), name: UIScreen.didConnectNotification, object: nil)
        notiC.addObserver(self, selector: #selector(didDisconenectScreen(noti:)), name: UIScreen.didDisconnectNotification, object: nil)
    }
    
    @objc func didConenectScreen(noti: Notification) {
        if let extScreen = UIScreen.screens.last {
            let screenFrame: CGRect = extScreen.applicationFrame;
            window = UIWindow(frame: screenFrame);
            window?.screen = extScreen;
            window?.rootViewController = ConsoleViewController();
            window?.isHidden = false;
        }
    }
    
    @objc func didDisconenectScreen(noti: Notification) {
        if nil != window {
            window?.isHidden = true;
            window = nil;
        }
    }
}
