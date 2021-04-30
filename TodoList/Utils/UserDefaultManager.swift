//
//  UserDefaultManager.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import Foundation

@propertyWrapper
fileprivate struct UserDefaultWrapper<E> {
    private let key: String
    private let defaultValue: E

    init(key: String, defaultValue: E) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: E {
        get {
            return UserDefaults.standard.object(forKey: key) as? E ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultManager {
    @UserDefaultWrapper(key: "todoList", defaultValue: [String]())
    static var todoList

    @UserDefaultWrapper(key: "detail", defaultValue: [String]())
    static var detail
}
