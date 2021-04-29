//
//  LoggedOutViewController.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/28.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
    func login(withEmail: String?, _ password: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    let bag = DisposeBag()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.placeholder = "email"
        view.addSubview(textField)
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.placeholder = "password"
        view.addSubview(textField)
        return textField
    }()

    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("confirm", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        view.addSubview(button)
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.listener?.login(withEmail: self?.emailTextField.text, self?.passwordTextField.text)
        }).disposed(by: bag)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }

    private func setupLayout() {
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(view).offset(120)
            $0.leading.trailing.equalTo(view).inset(40)
            $0.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.leading.trailing.height.equalTo(emailTextField)
        }

        confirmButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.height.equalTo(passwordTextField)
        }
    }
}
