//
//  RootBuilder.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/28.
//

import RIBs

protocol RootDependency: Dependency {
    // parent에서 주입하는 것들 (만약 RootViewController처럼 자신의 RIB에서 생성할 시 이곳에다가 명시 x) -> AppComponent가 RootDependency를 구현하고 있으므로
}

final class RootComponent: Component<RootDependency> {

    let rootViewController: RootViewController
    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency,
                                      rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)

        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let loggedInBuilder = LoggedInBuilder(dependency: component)
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          loggedOutBuilder: loggedOutBuilder,
                          loggedInBuilder: loggedInBuilder)
    }
}
