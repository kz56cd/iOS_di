//
//  UserTopViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class UserTopViewController: UIViewController, StoryboardView {

    @IBOutlet weak var userDetail01button: UIButton!
    @IBOutlet weak var userDetail02button: UIButton!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK - ReactorKit
extension UserTopViewController {
    func bind(reactor: UserTopViewReactor) {
        // Action
        userDetail01button.rx.tap
            .map {
                print("🤠 tapped: userDetail01")
                return Reactor.Action.tappedDetail01
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        userDetail02button.rx.tap
            .map {
                print("🤠 tapped: userDetail02")
                return Reactor.Action.tappedDetail02
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
