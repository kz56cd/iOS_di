//
//  AppDelegate.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/12.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var windowCoordinator: WindowCoordinator?
    var appDependencies: AppDependenciesProtocol?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        configureInfrastructure(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    // MARK: - private
    private func configureInfrastructure(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) {

        // NOTE: configure something

        prepareAppDependencies()
    }

    private func prepareAppDependencies() {
        appDependencies = AppDependencies()
        window = UIWindow(frame: UIScreen.main.bounds)
        windowCoordinator = appDependencies!.windowCoordinator(window: window!)
        windowCoordinator!.start()
    }
}
