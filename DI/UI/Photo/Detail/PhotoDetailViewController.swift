//
//  PhotoDetailViewController.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/21.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxSwift

class PhotoDetailViewController: UIViewController , StoryboardView {
    @IBOutlet weak var userDetailButton: UIButton!
    @IBOutlet weak var otherPhotoDetailButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigation()
    }
    
    // MARK: - private func
    private func prepareNavigation() {
        guard let reactor = reactor else { return }
        title = "Photo \(reactor.id)"
    }
}

// MARK: - ReactorKit
extension PhotoDetailViewController {
    func bind(reactor: PhotoDetailViewReactor) {
        // Action
        userDetailButton.rx.tap
            .map { Reactor.Action.tappedUserDetail }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        otherPhotoDetailButton.rx.tap
            .map { Reactor.Action.tappedOtherDetail }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
