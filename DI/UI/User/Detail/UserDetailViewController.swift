//
//  UserDetailViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class UserDetailViewController: UIViewController , StoryboardView {
    @IBOutlet weak var photoDetailButton: UIButton!
    @IBOutlet weak var otherUserDetailButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigation()
    }
    
    // MARK: - private func
    private func prepareNavigation() {
        guard let reactor = reactor else { return }
        title = "User \(reactor.id)"
    }
}

// MARK: - ReactorKit
extension UserDetailViewController {
    func bind(reactor: UserDetailViewReactor) {
        // Action
        photoDetailButton.rx.tap
            .map { Reactor.Action.tappedPhotoDetail }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        otherUserDetailButton.rx.tap
            .map { Reactor.Action.tappedOtherDetail }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
