//
//  UIFactories.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import Foundation

protocol UIFactoriesProtocol {
    var coordinatorFactory: CoordinatorFactoryType { get }
    var viewControllerFactory: ViewControllerFactoryType { get }
}

final class UIFactories: UIFactoriesProtocol {
    let viewControllerFactory: ViewControllerFactoryType
    let coordinatorFactory: CoordinatorFactoryType
    
    init(components: ComponentsProtocol) {
        let _viewControllerFactory = ViewControllerFactory(components: components)
        viewControllerFactory = _viewControllerFactory
        coordinatorFactory = CoordinatorFactory(
            viewControllerFactory: _viewControllerFactory,
            components: components
        )
    }
}
