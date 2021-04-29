//
//  TodoListInteractor.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs
import RxSwift

protocol TodoListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TodoListPresentable: Presentable {
    var listener: TodoListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TodoListListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TodoListInteractor: PresentableInteractor<TodoListPresentable>, TodoListInteractable, TodoListPresentableListener {

    weak var router: TodoListRouting?
    weak var listener: TodoListListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TodoListPresentable) {
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
