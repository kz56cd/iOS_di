//
//  WindowCoordinator.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class WindowCoordinator {
    
    private let window: UIWindow
    private let rootViewCoordinator: ViewControllerCoordinator
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactoryType) {
        self.window = window
        self.rootViewCoordinator = coordinatorFactory.rootViewCoordinator()
    }
    
    func start() {
        window.rootViewController = rootViewCoordinator.presenter
        window.makeKeyAndVisible()
        rootViewCoordinator.start()
    }
}
