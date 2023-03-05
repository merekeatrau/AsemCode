//
//  ViewController.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    let cardInfo = [
        Card(progress: "51", header: "Level 1", subheader: "Basic", bgImage: UIImage(named: "level1")),
        Card(progress: "10", header: "Level 2", subheader: "Basic", bgImage: UIImage(named: "level2")),
        Card(progress: "3", header: "Level 3", subheader: "Basic", bgImage: UIImage(named: "level3")),
        Card(progress: "1", header: "Level 4", subheader: "Basic", bgImage: UIImage(named: "level4")),
        Card(progress: "1", header: "Level 5", subheader: "Basic", bgImage: UIImage(named: "level5"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Course content"
        let userButton = UIBarButtonItem(image: UIImage(named: "avatar")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(userButtonTapped))
        navigationItem.rightBarButtonItem = userButton
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        setConstraints()
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
        return cell
    }

}

