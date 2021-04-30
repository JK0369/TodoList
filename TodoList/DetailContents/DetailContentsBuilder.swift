//
//  DetailContentsBuilder.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs

protocol DetailContentsDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var memoStream: MemoStream { get }
}

final class DetailContentsComponent: Component<DetailContentsDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    fileprivate var memoStream: MemoStream {
        return dependency.memoStream
    }
}

// MARK: - Builder

protocol DetailContentsBuildable: Buildable {
    func build(withListener listener: DetailContentsListener) -> DetailContentsRouting
}

final class DetailContentsBuilder: Builder<DetailContentsDependency>, DetailContentsBuildable {

    override init(dependency: DetailContentsDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DetailContentsListener) -> DetailContentsRouting {
        let component = DetailContentsComponent(dependency: dependency)
        let viewController = DetailContentsViewController()
        let interactor = DetailContentsInteractor(presenter: viewController, memoStream: component.memoStream)
        interactor.listener = listener
        return DetailContentsRouter(interactor: interactor, viewController: viewController)
    }
}
