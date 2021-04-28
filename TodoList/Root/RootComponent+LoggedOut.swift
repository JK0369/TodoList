//
//  RootComponent+LoggedOut.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/28.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedOut scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedOut: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedOut scope.
}

extension RootComponent: LoggedOutDependency {

    // TODO: Implement properties to provide for LoggedOut scope.
}
