//
// Created by sk on 2021/11/13.
//

import Foundation

public protocol AssociateObjcProtocol {
    var associateValue: Any? { get set }
}

fileprivate class Wrapper<T> {
    var value: T?

    init(_ value: T?) {
        self.value = value
    }
}

public extension AssociateObjcProtocol {

    var associateValue: Any? {
        mutating get {
            guard  let wrapper = objc_getAssociatedObject(self, &self) as? Wrapper<Any> else {
                return nil
            }
            return wrapper.value
        }
        set {
            let wrapper = Wrapper<Any>(newValue)
            objc_setAssociatedObject(self, &self, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


extension NSObject: AssociateObjcProtocol {
    public var associateValue: Any? {
        get {
            guard  let wrapper = objc_getAssociatedObject(self, UnsafeRawPointer.init(bitPattern: self.hashValue)!) as? Wrapper<Any> else {
                return nil
            }
            return wrapper.value
        }
        set {
            let wrapper = Wrapper<Any>(newValue)
            objc_setAssociatedObject(self, UnsafeRawPointer.init(bitPattern: self.hashValue)!, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}