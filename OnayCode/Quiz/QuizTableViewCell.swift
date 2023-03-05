//
//  QuizTableViewCell.swift
//  OnayCode
//
//  Created by Artyom Prima on 05.03.2023.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    static let identifier = "QuizTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9607842565, green: 0.9607844949, blue: 0.9650899768, alpha: 1)
        contentView.addSubview(buttons)
        buttons.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        buttons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        buttons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        for title in buttonTitles {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true 
            buttons.addArrangedSubview(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let buttonTitles = ["Button 1", "Button 2", "Button 3", "Button 4", "Button 5"]

    let buttons: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 15

        return stack
    }()
    
}
