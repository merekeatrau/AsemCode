//
//  QuizTableViewCell.swift
//  OnayCode
//
//  Created by Artyom Prima on 07.03.2023.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    static let identifier = "QuizTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9607842565, green: 0.9607844949, blue: 0.9650899768, alpha: 1)
        setSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buttonAnswer: UIButton = {
        let button = UIButton()
        button.setTitle("Flutter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    func setSubview(){
        contentView.addSubview(buttonAnswer)
        buttonAnswer.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(12)
            make.leading.equalTo(contentView).offset(32)
            make.trailing.equalTo(contentView).offset(-32)
            make.bottom.equalTo(contentView).offset(-12)
        }
    }
}
