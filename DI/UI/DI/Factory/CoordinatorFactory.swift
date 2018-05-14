//
//  CoordinatorFactory.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryType {
    // MARK: - common
    func windowCoordinator(window: UIWindow) -> WindowCoordinator
    func rootViewCoordinator() -> RootViewCoordinator
    func mainTabCoordinator() -> MainTabCoordinator
    
    // MARK: - personal
//    func welcomeCoordinator() -> WelcomeCoordinator
    func photoCoordinator() -> PhotoCoordinatorProtocol
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
    
    // MARK: - common
    func windowCoordinator(window: UIWindow) -> WindowCoordinator {
        return WindowCoordinator(window: window, coordinatorFactory: self)
    }
    func rootViewCoordinator() -> RootViewCoordinator {
        return RootViewCoordinator(
            viewControllerFactory: viewControllerFactory,
            coordinatorFactory: self
        )
    }
    func mainTabCoordinator() -> MainTabCoordinator {
        return MainTabCoordinator(
            viewControllerFactory: viewControllerFactory,
            coordinatorFactory: self
        )
    }
    
    // MARK: - personal
    func photoCoordinator() -> PhotoCoordinatorProtocol {
        return PhotoCoordinator(
            viewControllerFactory: viewControllerFactory,
            coordinatorFactory: self
        )
    }
}
