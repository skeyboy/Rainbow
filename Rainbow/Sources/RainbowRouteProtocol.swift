//
// Created by sk on 2021/11/13.
//

import Foundation
import UIKit

public typealias URLPattern = String
public typealias RouteContext = Dictionary<AnyHashable, Any?>
public typealias URLViewControllerConvertible = (Bool, UIViewController?)

public protocol RainbowRouteProtocol {
    func viewControllerClassName(url: URLPattern, context: RouteContext) -> String?
    func viewController(for url: URLPattern, with context: RouteContext) -> URLViewControllerConvertible
}

public extension RainbowRouteProtocol {
    func open(url: URLPattern, context: RouteContext) -> URLViewControllerConvertible {
        viewController(for: url, with: context)
    }
}

extension RainbowRouteProtocol {
    public func viewController(for url: URLPattern, with context: RouteContext) -> URLViewControllerConvertible {
        guard let KindClassName = viewControllerClassName(url: url, context: context), let KindClass = NSClassFromString(KindClassName) else {
            return (false, nil)
        }
        return (true, KindClass.init() as? UIViewController)
    }

    public func viewControllerClassName(url: URLPattern, context: RouteContext) -> String? {
        nil
    }
}