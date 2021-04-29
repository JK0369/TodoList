//
//  LoggedInComponent+TodoList.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the TodoList scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyTodoList: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the TodoList scope.
}

extension LoggedInComponent: TodoListDependency {

    // TODO: Implement properties to provide for TodoList scope.
}
