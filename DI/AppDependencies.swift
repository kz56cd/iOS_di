//
//  AppDependencies.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

protocol AppDependenciesProtocol {
    
    var components: ComponentsProtocol { get }
    var uiFactories: UIFactoriesProtocol { get }
    
    func windowCoordinator(window: UIWindow) -> WindowCoordinator
}

final class AppDependencies: AppDependenciesProtocol {
    
    let components: ComponentsProtocol
    let uiFactories: UIFactoriesProtocol
    
    init() {
        components = Components()
        uiFactories = UIFactories(components: components)
    }
    
    func windowCoordinator(window: UIWindow) -> WindowCoordinator {
        return uiFactories.coordinatorFactory.windowCoordinator(window: window)
    }
}
