//
//  DetailContentsRouter.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs

protocol DetailContentsInteractable: Interactable {
    var router: DetailContentsRouting? { get set }
    var listener: DetailContentsListener? { get set }
}

protocol DetailContentsViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class DetailContentsRouter: ViewableRouter<DetailContentsInteractable, DetailContentsViewControllable>, DetailContentsRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: DetailContentsInteractable, viewController: DetailContentsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
