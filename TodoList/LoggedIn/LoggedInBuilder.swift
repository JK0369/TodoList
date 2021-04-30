//
//  LoggedInBuilder.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var LoggedInViewController: LoggedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var LoggedInViewController: LoggedInViewControllable {
        return dependency.LoggedInViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    var mutableMemoStream: MutableMemoStream {
        return shared { MemoStreamImpl() }
    }

    let email: String?
    let password: String?

    init(dependency: LoggedInDependency, email: String?, password: String?) {
        self.email = email
        self.password = password
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener, email: String?, password: String?) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, email: String?, password: String?) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency, email: email, password: password)
        let interactor = LoggedInInteractor(mutableMemoStream: component.mutableMemoStream)
        let todoListBuilder = TodoListBuilder(dependency: component)
        let detailContentsBuilder = DetailContentsBuilder(dependency: component)
        interactor.listener = listener
        return LoggedInRouter(interactor: interactor,
                              viewController: component.LoggedInViewController,
                              todoListBuilder: todoListBuilder,
                              detailContentsBuilder: detailContentsBuilder)
    }
}
