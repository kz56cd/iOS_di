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
//    func mainTab() -> (MainTabViewController, MainTabViewRouting)

    // MARK: - personal
}

final class ViewControllerFactory: ViewControllerFactoryType {
    private let components: ComponentsProtocol
    
    init(components: ComponentsProtocol) {
        self.components = components
    }
    
    func rootViewController() -> RootViewController {
        // WIP
        return RootViewController()
    }
}
