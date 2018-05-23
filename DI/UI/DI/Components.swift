//
//  Components.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import Foundation

protocol ComponentsProtocol {
    var anyService: AnyService { get }
}

final class Components: ComponentsProtocol {

    let anyService: AnyService

    init() {
        anyService = AnyService()
    }
}
