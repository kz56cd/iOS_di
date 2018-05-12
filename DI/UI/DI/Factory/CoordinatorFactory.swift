//
//  CoordinatorFactory.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryType {
    // MARK: - common
//    func windowCoordinator(window: UIWindow) -> WindowCoordinator
//    func rootViewCoordinator() -> RootViewCoordinator
//    func mainTabCoordinator() -> MainTabCoordinator
    
    // MARK: - personal
//    func welcomeCoordinator() -> WelcomeCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryType {
    private let viewControllerFactory: ViewControllerFactoryType
    private let components: ComponentsProtocol
    
    init(
        viewControllerFactory: ViewControllerFactoryType,
        components: ComponentsProtocol
        ) {
        self.viewControllerFactory = viewControllerFactory
        self.components = components
    }
}
