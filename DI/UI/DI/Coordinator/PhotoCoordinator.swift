//
//  PhotoCoordinator.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import FontAwesomeKit

// TODO: Inheritance detailPresentable...
protocol PhotoCoordinatorProtocol: NavigationCoordinator, DetailsPresentable {
    // stub
}

final class PhotoCoordinator: PhotoCoordinatorProtocol {
    let navigationController: UINavigationController
    let viewControllerFactory: ViewControllerFactoryType
    let coordinatorFactory: CoordinatorFactoryType

    init(
        viewControllerFactory: ViewControllerFactoryType,
        coordinatorFactory: CoordinatorFactoryType
        ) {
        self.viewControllerFactory = viewControllerFactory
        self.coordinatorFactory = coordinatorFactory

        navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.barTintColor = .white
        navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: FAKFontAwesome.photoIcon(withSize: 30).image(with: CGSize(width: 30, height: 30)),
            selectedImage: nil
        )
        navigationController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
    }

    func start() {
        let viewController = viewControllerFactory.photoTop()
        navigationController.pushViewController(viewController, animated: true)

        // NOTE: Add routing by router if you like ('router' also means viewmodel, or reactor..)
        _ = viewController.reactor?
            .routeSelected
            .subscribe(onNext: { [weak self] route in
                guard let route = route else { return }
                switch route {
                case .detail01:
                    print("💋 PhotoCoordinator: detail01")
                    self?.pushPhotoDetail(by: 1)
                case .detail02:
                    print("💋 PhotoCoordinator: detail02")
                    self?.pushPhotoDetail(by: 2)
                }
            })

    }
}
