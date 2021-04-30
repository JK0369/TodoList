//
//  DetailContentsViewController.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs
import RxSwift
import UIKit

protocol DetailContentsPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DetailContentsViewController: UIViewController, DetailContentsPresentable, DetailContentsViewControllable {

    weak var listener: DetailContentsPresentableListener?
}
