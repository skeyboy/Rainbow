//
// Created by sk on 2021/11/13.
//

import Foundation

public typealias RainbowContext = Dictionary<AnyHashable, Any?>

open class Rainbow {
    public fileprivate(set) var plugins: [RainbowModulePlugin] = [RainbowModulePlugin]()

    private init() {

    }

    public static let shared = Rainbow()

    public func register(plugin: RainbowModulePlugin) {
        plugins.append(plugin)
    }

    public func route(module: String, url: URLPattern, params: RainbowContext) -> Bool? {
        guard let dest = find(module: module, url: url, params: params) else {
            return false
        }
        let result = dest.urlMap[url]?.open(url: url, context: params)
        return result?.0
    }

    public func find(module: String, url: URLPattern, params: [AnyHashable: Any?]) -> RainbowModule? {
        let item = plugins.first {
            $0.modules.first {
                $0.moduleName == module
            } != nil
        }
        return item?.modules.first { it in
            it.urlMap[url] != nil

        }
    }
}
