//
//  LoggedInRouter.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs

protocol LoggedInInteractable: Interactable, TodoListListener, DetailContentsListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         todoListBuilder: TodoListBuildable,
         detailContentsBuilder: DetailContentsBuildable) {
        self.viewController = viewController
        self.todoListBuilder = todoListBuilder
        self.detailContentsBuilder = detailContentsBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        attachTodoList()
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
        if let currentChild = currentChild {
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }

    func routeToDetailContents() {
        detachCurrentChild()

        let detailContent = detailContentsBuilder.build(withListener: interactor)
        currentChild = detailContent
        attachChild(detailContent)
        viewController.present(viewController: detailContent.viewControllable)
    }

    // MARK: - Private

    private let viewController: LoggedInViewControllable
    private let todoListBuilder: TodoListBuildable
    private let detailContentsBuilder: DetailContentsBuildable
    private var currentChild: ViewableRouting?

    func attachTodoList() {
        let todoList = todoListBuilder.build(withListener: interactor)
        currentChild = todoList
        attachChild(todoList)
        viewController.present(viewController: todoList.viewControllable)
    }

    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }

}
