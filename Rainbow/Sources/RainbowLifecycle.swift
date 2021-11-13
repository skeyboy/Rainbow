//
// Created by sk on 2021/11/13.
//

import Foundation
import UIKit

@objc protocol RainbowLifecycleListener {
    func objcDidBecomeActivity()
    func didBecomeActivity()
}

extension Rainbow: RainbowLifecycleListener {
    func listen() {
        NotificationCenter.default.addObserver(self, selector: #selector(objcDidBecomeActivity), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    func objcDidBecomeActivity() {
        didBecomeActivity()
    }

    func didBecomeActivity() {

    }
}

protocol RainbowLifecycle {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    func applicationDidBecomeActive(_ application: UIApplication)
}

extension RainbowLifecycle where Self: Rainbow {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        fatalError("application(_:didFinishLaunchingWithOptions:) has not been implemented")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        plugins.forEach { plugin in

//           NotificationCenter.default.addObserver(self, selector: #selector(), name: UIApplication.didBecomeActiveNotification, object: nil)
        }
    }

}

extension Rainbow: RainbowLifecycle {

}