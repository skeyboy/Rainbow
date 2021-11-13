//
// Created by sk on 2021/11/13.
//

import Foundation

public protocol RainbowModulePlugin {
    init(context: RainbowContext)

    var modules: [RainbowModule] { get }
}

extension RainbowModulePlugin {
    public var rainbow: Rainbow {
        Rainbow.shared
    }
}

open class RainbowModulePluginItem: RainbowModulePlugin {
    public private(set) var modules: [RainbowModule] = [RainbowModule]()
    var context: RainbowContext

    required public init(context: RainbowContext) {
        self.context = context
    }

    public func register(module: RainbowModule) -> Bool {
        let contains = modules.contains {
            it in
            it.moduleName == module.moduleName
        }
        if contains {
            return false
        }
        modules.append(module)
        return true
    }
}
