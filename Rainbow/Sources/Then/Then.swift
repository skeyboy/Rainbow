//
// Created by sk on 2021/11/13.
//

import Foundation

public protocol Then {
}

#if os(iOS)
import UIKit

public extension Then where Self: NSObjectProtocol {
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

public extension Then where Self: Any {
    func with(_ block: (inout Self) -> Void) -> Self {
        var tmp = self
        block(&tmp)
        return tmp
    }

    @discardableResult
    func `do`(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

extension NSObject: Then {
}

extension CGPoint: Then {
}

extension CGRect: Then {
}

extension CGVector: Then {
}

//let vv = UIView().then {
//    $0.backgroundColor = .red
//}
//
//var xx = CGPoint(x: 10, y: 10).with { v in
//    v.x = 222
//    v.y = 33
//}
//
//let ud = UserDefaults.standard.do { ud in
//    ud.synchronize()
//}

#endif
