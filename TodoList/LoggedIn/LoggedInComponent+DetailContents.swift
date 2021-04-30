//
//  LoggedInComponent+DetailContents.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedIn to provide for the DetailContents scope.
// TODO: Update LoggedInDependency protocol to inherit this protocol.
protocol LoggedInDependencyDetailContents: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedIn to provide dependencies
    // for the DetailContents scope.
}

extension LoggedInComponent: DetailContentsDependency {

    // TODO: Implement properties to provide for DetailContents scope.
    var memoStream: MemoStream {
        return mutableMemoStream
    }
}
