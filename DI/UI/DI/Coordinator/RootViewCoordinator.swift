//
//  RootViewCoordinator.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class RootViewCoordinator {
    
    fileprivate let rootViewController: RootViewController
//    fileprivate let mainTabCoordinator: MainTabCoordinator
//    fileprivate var welcomeCoordinator: WelcomeCoordinator?
    
    let viewControllerFactory: ViewControllerFactoryType
    fileprivate let coordinatorFactory: CoordinatorFactoryType
    
    init(
        viewControllerFactory: ViewControllerFactoryType,
        coordinatorFactory: CoordinatorFactoryType
        ) {
        self.viewControllerFactory = viewControllerFactory
        self.coordinatorFactory = coordinatorFactory
        rootViewController = viewControllerFactory.rootViewController()
//        mainTabCoordinator = coordinatorFactory.mainTabCoordinator()
    }
}

// MARK: - ViewControllerCoordinator
extension RootViewCoordinator: ViewControllerCoordinator {
    var presenter: UIViewController {
        return rootViewController as UIViewController
    }
    
    func start() {
//        rootViewController.viewController = mainTabCoordinator.presenter
//        mainTabCoordinator.start()
        
//        if !TokenStatusProvider().hasTokens {
//            presentWelcomeViews()
//        }
    }
    
//    private func presentWelcomeViews() {
//        welcomeCoordinator = coordinatorFactory.welcomeCoordinator()
//        welcomeCoordinator?.start()
//        welcomeCoordinator?.shouldDismissSelf
//            .observeValues { [weak self] _ in
//                self?.welcomeCoordinator?.presenter.dismiss(animated: true, completion: nil)
//                self?.welcomeCoordinator = nil
//        }
//        rootViewController.present(welcomeCoordinator!.presenter, animated: true, completion: nil)
//    }
}
