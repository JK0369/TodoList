//
//  TodoListBuilder.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs

protocol TodoListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var inputEmail: String { get }
    var inputPassword: String { get }
}

final class TodoListComponent: Component<TodoListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    fileprivate var email: String {
        return dependency.inputEmail
    }

    fileprivate var password: String {
        return dependency.inputPassword
    }
}

// MARK: - Builder

protocol TodoListBuildable: Buildable {
    func build(withListener listener: TodoListListener) -> TodoListRouting
}

final class TodoListBuilder: Builder<TodoListDependency>, TodoListBuildable {

    override init(dependency: TodoListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TodoListListener) -> TodoListRouting {
        let component = TodoListComponent(dependency: dependency)
        let viewController = TodoListViewController()
        let interactor = TodoListInteractor(presenter: viewController)
        interactor.listener = listener
        return TodoListRouter(interactor: interactor, viewController: viewController)
    }
}
