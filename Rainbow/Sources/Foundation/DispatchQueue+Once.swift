//
// Created by sk on 2021/11/13.
//

import Foundation

public extension DispatchQueue {
    fileprivate static var containers: [String] = [String]()

    class func once(token: String = "\(#file):\(#line)", block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if containers.contains(token) {
            return
        }
        containers.append(token)
        block()
    }
}
