//
//  PhotoDetailViewReactor.swift
//  DI
//
//  Created by Masakazu Sano on 2018/05/21.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import ReactorKit
import RxSwift

protocol PhotoDetailViewRouting {
    var routeSelected: Observable<PhotoDetailViewRouter?> { get }
}

enum PhotoDetailViewRouter {
    case userDetail(id: Int)
    case detail01
    case detail02
}

final class PhotoDetailViewReactor: Reactor {
    
    enum Action {
        case tappedUserDetail
        case tappedOtherDetail
    }
    
    enum Mutation {}
    
    struct State {}
    
    let initialState = State()
    let id: Int
    
    let routeSelected: Observable<PhotoDetailViewRouter?>

    private var routeSelectedSubject = PublishSubject<PhotoDetailViewRouter?>()
    
    init(_ id: Int) {
        self.id = id
        routeSelected = routeSelectedSubject.asObservable()
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tappedUserDetail:
            routeSelectedSubject.onNext(.userDetail(id: self.id))
            return Observable.empty()
        case .tappedOtherDetail:
            print(id)
            switch id {
            case 1:
                print("くる")
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

extension PhotoDetailViewReactor: PhotoDetailViewRouting {
}

