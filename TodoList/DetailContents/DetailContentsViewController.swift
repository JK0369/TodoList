//
//  DetailContentsViewController.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/30.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol DetailContentsPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DetailContentsViewController: UIViewController, DetailContentsPresentable, DetailContentsViewControllable {

    weak var listener: DetailContentsPresentableListener?

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        view.addSubview(l)
        l.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.right.equalTo(view).inset(40)
            make.height.equalTo(30)
        }
        return l
    }()

    lazy var detailLabel: UILabel = {
        let l = UILabel()
        view.addSubview(l)
        l.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(40)
            make.height.equalTo(30)
        }
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    func set(memo: Memo) {
        titleLabel.text = memo.title
        detailLabel.text = memo.detail
    }

}
