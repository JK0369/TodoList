//
//  DetailContentsInteractor.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs
import RxSwift

protocol DetailContentsRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol DetailContentsPresentable: Presentable {
    var listener: DetailContentsPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol DetailContentsListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class DetailContentsInteractor: PresentableInteractor<DetailContentsPresentable>, DetailContentsInteractable, DetailContentsPresentableListener {

    weak var router: DetailContentsRouting?
    weak var listener: DetailContentsListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: DetailContentsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}