//
// Created by sk on 2021/11/13.
//

import Foundation

public protocol DefaultValue {
    associatedtype Value
    static var defaultValue: Value { get }
}

extension String: DefaultValue {
    public static var defaultValue: String {
        ""
    }
}

extension Bool: DefaultValue {
    public static var defaultValue: Bool {
        false
    }
}

@propertyWrapper
struct Default<T: DefaultValue> {
    public private(set) var wrappedValue: T.Value

    init(_ wrappedValue: T.Value = T.defaultValue) {
        self.wrappedValue = wrappedValue
    }
}
