//
//  MainTabCoordinator.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class MainTabCoordinator {
    fileprivate let mainTabController: MainTabViewController
//    fileprivate let mainTabRouter: MainTabViewRouting

    fileprivate let childCoordinators: [ViewControllerCoordinator]
    let viewControllerFactory: ViewControllerFactoryType

//    fileprivate var welcomeCoordinator: WelcomeCoordinatorProtocol

    init(
        viewControllerFactory: ViewControllerFactoryType,
        coordinatorFactory: CoordinatorFactoryType
//        welcomeCoordinator: WelcomeCoordinatorProtocol
        ) {

        self.viewControllerFactory = viewControllerFactory
//        self.welcomeCoordinator = welcomeCoordinator

        let vc = viewControllerFactory.mainTab()
        mainTabController = vc
//        mainTabRouter = router
        childCoordinators = [
            coordinatorFactory.photoCoordinator(),
            coordinatorFactory.userCoordinator()
        ]
    }
}

extension MainTabCoordinator: ViewControllerCoordinator {

    var presenter: UIViewController {
        return mainTabController as UIViewController
    }

    func start() {
        mainTabController.setViewControllers(
            childCoordinators.map { $0.presenter },
            animated: false
        )
        childCoordinators.forEach { $0.start() }
    }
}
