//
//  PhotoTopViewReactor.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/14.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxSwift

protocol PhotoTopViewRouting {
    var routeSelected: Observable<PhotoTopViewRouter?> { get }
}

enum PhotoTopViewRouter {
    case detail01
    case detail02
}

final class PhotoTopViewReactor: Reactor {

    enum Action {
        case tappedDetail01
        case tappedDetail02
    }

    enum Mutation {}

    struct State {}

    let routeSelected: Observable<PhotoTopViewRouter?>
    let initialState = State()

    private var routeSelectedSubject = PublishSubject<PhotoTopViewRouter?>()

    init() {
        routeSelected = routeSelectedSubject.asObservable()
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tappedDetail01:
            print("mutate: .tappedDetail01")
            routeSelectedSubject.onNext(.detail01)
            return Observable.empty()
        case .tappedDetail02:
            print("mutate: .tappedDetail02")
            routeSelectedSubject.onNext(.detail02)
            return Observable.empty()
        }
    }

    func reduce(
        state: State,
        mutation: Mutation
        ) -> State {

        switch mutation {
            // no mutation cases
        }
    }
}

extension PhotoTopViewReactor: PhotoTopViewRouting {
}
