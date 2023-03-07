//
//  QuizViewController.swift
//  OnayCode
//
//  Created by Artyom Prima on 07.03.2023.
//

import UIKit
import SnapKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.isHidden = true 
    }
    
    let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        tableView.register(QuizHeader.self, forHeaderFooterViewReuseIdentifier: QuizHeader.identifier)
        tableView.register(QuizTableViewCell.self, forCellReuseIdentifier: QuizTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension QuizViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: QuizHeader.identifier) as! QuizHeader
        headerView.didBackTapped = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
            print("tap")
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 262
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        default:
            return 60
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuizTableViewCell.identifier, for: indexPath) as? QuizTableViewCell else { return QuizTableViewCell() }
        return cell
    }

}
