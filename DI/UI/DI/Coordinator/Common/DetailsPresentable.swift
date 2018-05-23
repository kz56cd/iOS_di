//
//  DetailsPresentable.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/21.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailsPresentable: class {
    func pushPhotoDetail(by id: Int)
    func pushUserDetail(by id: Int)
}

extension DetailsPresentable where Self: NavigationCoordinator {

    func pushPhotoDetail(by id: Int) {
        let viewController = viewControllerFactory.photoDetail(by: id)
        navigationController.pushViewController(viewController, animated: true)

        _ = viewController.reactor?
            .routeSelected
            .subscribe(onNext: { [weak self] route in
                guard let route = route else { return }
                switch route {
                case .userDetail(let id):
                    self?.pushUserDetail(by: id)
                case .detail01:
                    self?.pushPhotoDetail(by: 1)
                case .detail02:
                    self?.pushPhotoDetail(by: 2)
                }
            })
    }

    func pushUserDetail(by id: Int) {
        let viewController = viewControllerFactory.userDetail(by: id)
        navigationController.pushViewController(viewController, animated: true)

        _ = viewController.reactor?
            .routeSelected
            .subscribe(onNext: { [weak self] route in
                guard let route = route else { return }
                switch route {
                case .photoDetail(let id):
                    self?.pushPhotoDetail(by: id)
                case .detail01:
                    self?.pushUserDetail(by: 1)
                case .detail02:
                    self?.pushUserDetail(by: 2)
                }
            })
    }
}
