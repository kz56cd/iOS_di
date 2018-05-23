//
//  UserDetailViewReactor.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxSwift

protocol UserDetailViewRouting {
    var routeSelected: Observable<UserDetailViewRouter?> { get }
}

enum UserDetailViewRouter {
    case photoDetail(id: Int)
    case detail01
    case detail02
}

final class UserDetailViewReactor: Reactor {

    enum Action {
        case tappedPhotoDetail
        case tappedOtherDetail
    }

    enum Mutation {}

    struct State {}

    let initialState = State()
    let id: Int

    let routeSelected: Observable<UserDetailViewRouter?>

    private var routeSelectedSubject = PublishSubject<UserDetailViewRouter?>()

    init(_ id: Int) {
        self.id = id
        routeSelected = routeSelectedSubject.asObservable()
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tappedPhotoDetail:
            routeSelectedSubject.onNext(.photoDetail(id: self.id))
            return Observable.empty()
        case .tappedOtherDetail:
            print(id)
            switch id {
            case 1:
                routeSelectedSubject.onNext(.detail02)
            case 2:
                routeSelectedSubject.onNext(.detail01)
            default:
                break
            }
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

extension UserDetailViewReactor: UserDetailViewRouting {
}
