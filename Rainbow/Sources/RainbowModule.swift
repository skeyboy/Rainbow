//
// Created by sk on 2021/11/13.
//

import Foundation


public protocol RainbowModule {
    var urlMap: [String: RainbowRouteProtocol] { get }
    var moduleName: String { get }
}

enum Module: RainbowModule {
    var urlMap: [String: RainbowRouteProtocol] {
        switch self {
        case .me:
            return [:]
        case .transition:
            return [:]
        }
    }

    var moduleName: String {
        switch self {
        case .me:
            return "/me"
        case .transition:
            return "/transition"
        }
    }

    case me
    case transition
}