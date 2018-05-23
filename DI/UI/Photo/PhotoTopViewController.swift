//
//  PhotoTopViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class PhotoTopViewController: UIViewController, StoryboardView {

    @IBOutlet weak var photoDetail01button: UIButton!
    @IBOutlet weak var photoDetail02button: UIButton!
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK - ReactorKit
extension PhotoTopViewController {
    func bind(reactor: PhotoTopViewReactor) {
        // Action
        photoDetail01button.rx.tap
            .map {
                print("🤠 tapped: photoDetail01")
                return Reactor.Action.tappedDetail01
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        photoDetail02button.rx.tap
            .map {
                print("🤠 tapped: photoDetail02")
                return Reactor.Action.tappedDetail02
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
