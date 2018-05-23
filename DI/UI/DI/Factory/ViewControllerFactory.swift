//
//  ViewControllerFactory.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

protocol ViewControllerFactoryType {
    // MARK: - common
    func rootViewController() -> RootViewController
    func mainTab() -> MainTabViewController

    // MARK: - personal
    func photoTop() -> PhotoTopViewController
    func photoDetail(by id: Int) -> PhotoDetailViewController

    func userTop() -> UserTopViewController
}

final class ViewControllerFactory: ViewControllerFactoryType {
    private let components: ComponentsProtocol
    
    init(components: ComponentsProtocol) {
        self.components = components
    }
    
    // MARK: - common
    func rootViewController() -> RootViewController {
        return StoryboardScene.RootViewController.initialScene.instantiate()
    }
    func mainTab() -> MainTabViewController {
        return MainTabViewController()
    }
    
    // MARK: - personal
    func photoTop() -> PhotoTopViewController {
        let viewController = StoryboardScene.PhotoTopViewController.initialScene.instantiate()
        viewController.reactor = PhotoTopViewReactor()
        return viewController
    }
    func photoDetail(by id: Int) -> PhotoDetailViewController {
        let viewController = StoryboardScene.PhotoDetailViewController.initialScene.instantiate()
        viewController.reactor = PhotoDetailViewReactor(id)
        return viewController
    }
    
    func userTop() -> UserTopViewController {
        let viewController = StoryboardScene.UserTopViewController.initialScene.instantiate()
        viewController.reactor = UserTopViewReactor()
        return viewController
    }
}
