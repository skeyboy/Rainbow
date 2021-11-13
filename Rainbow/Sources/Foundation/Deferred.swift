//
// Created by sk on 2021/11/13.
//

import Foundation

class Deferred<T: NSObjectProtocol> {
    private(set) public weak var value: T?
    fileprivate(set) var block: (() -> Void)?

    init(_ value: T?, block: (() -> Void)?) {
        self.value = value
    }

    deinit {
        block?()
    }
}

public extension NSObject {
    func deferred(_ block: (() -> Void)?) {
        guard  (associateValue as? Deferred<Self>) == nil else {
            return
        }
        associateValue = Deferred(self, block: block)
    }
}
