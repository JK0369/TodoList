//
//  TodoListViewController.swift
//  TodoList
//
//  Created by 김종권 on 2021/04/29.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol TodoListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TodoListViewController: UIViewController, TodoListPresentable, TodoListViewControllable {

    weak var listener: TodoListPresentableListener?
    var data = [String]()

    init(email: String, password: String) {
        self.email = email
        self.password = password
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("IB is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        loadData()
    }

    // MARK: - Private

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = email
        view.addSubview(label)
        return label
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        view.addSubview(button)
        return button
    }()

    private lazy var topContainerView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        view.backgroundColor = .lightGray

        view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.leading.trailing.equalTo(self.view)
            make.height.equalTo(50)
        }

        emailLabel.snp.makeConstraints { (make) in
            make.centerY.centerX.equalTo(view)
        }

        addButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.trailing.equalTo(view.snp.trailing).inset(12)
        }

        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topContainerView.snp.bottom)
            make.leading.bottom.trailing.equalTo(self.view)
        }
        return tableView
    }()

    private let email: String
    private let password: String
}

extension TodoListViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }

    func loadData() {
        let data = UserDefaultManager.todoList
        self.data = data
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")! as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
