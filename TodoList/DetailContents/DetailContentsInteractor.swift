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
    func set(memo: Memo)
}

protocol DetailContentsListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class DetailContentsInteractor: PresentableInteractor<DetailContentsPresentable>, DetailContentsInteractable, DetailContentsPresentableListener {

    weak var router: DetailContentsRouting?
    weak var listener: DetailContentsListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: DetailContentsPresentable, memoStream: MemoStream) {
        self.memoStream = memoStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        updateMemo()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

    // MARK: - Private

    private let memoStream: MemoStream

    private func updateMemo() {
        memoStream.memo
            .subscribe(onNext: { [weak self] in
                self?.presenter.set(memo: $0)
            }).disposeOnDeactivate(interactor: self)
    }

}
