//
//  ViewController.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Course content"

        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(userButtonTapped))
        userButton.tintColor = UIColor(hex: "677FFF")
        navigationItem.rightBarButtonItem = userButton

        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setConstraints()
        addTabBar()

    }

    private func addTabBar() {
        let tabBarController = TabBarController()
        let tabBarHeight = tabBarController.tabBar.frame.size.height
        let tabBarY = view.frame.size.height - tabBarHeight
        let tabBarFrame = CGRect(x: 0, y: tabBarY, width: view.frame.size.width, height: tabBarHeight)
        tabBarController.view.frame = tabBarFrame
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }

    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 450
        tableView.backgroundColor = .clear
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    @objc func userButtonTapped() {

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        cell.selectionStyle = .none
        cell.headerLabel.text = cardInfo[indexPath.row].header
        cell.subheaderLabel.text = cardInfo[indexPath.row].subheader
        cell.backgroundImageView.image = cardInfo[indexPath.row].bgImage
        let result = Double(cardInfo[indexPath.row].progress) ?? 0.0 / 100.0
        cell.progressLabel.text = cardInfo[indexPath.row].progress + "%"
        cell.progressView.progress = Float(result/100)

        if indexPath.row != 0 {
            cell.iconImageView.image = UIImage(named: "padlock")
            cell.separatorView.backgroundColor = .systemGray
        }
        return cell

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let quizVc = QuizViewController()
            navigationController?.pushViewController(quizVc, animated: true)
        default:
            print("Something wrong")
        }
    }
}

