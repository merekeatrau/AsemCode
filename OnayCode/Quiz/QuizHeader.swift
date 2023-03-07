//
//  QuizHeader.swift
//  OnayCode
//
//  Created by Artyom Prima on 07.03.2023.
//

import UIKit

class QuizHeader: UITableViewHeaderFooterView {
    
    static let identifier = "QuizHeader"
    
    var didBackTapped: (() -> Void)?
    
    override init(reuseIdentifier: String?)  {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9607842565, green: 0.9607844949, blue: 0.9650899768, alpha: 1)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundImage")
        return image
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "left"), for: .normal)
        return button
    }()
    
    @objc func turnBack() {
        didBackTapped?()
        print("tap")
    }
    
    private let ellipseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ellipseImage")
        return image
    }()
    
    private let questionsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.text = " What side you're on."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    func addSubviews() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(buttonBack)
        contentView.addSubview(questionsLabel)
        contentView.addSubview(ellipseImage)
        buttonBack.addTarget(self, action: #selector(turnBack), for: .touchUpInside)
        
    }
    
    func setConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        buttonBack.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.top.equalTo(contentView).offset(16)
            make.leading.equalTo(contentView).offset(16)
        }
        
        questionsLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(104)
            make.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
            make.bottom.equalTo(contentView).offset(-28)
        }
        
        ellipseImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(35)
            make.leading.equalTo(contentView).offset(129)
            make.trailing.equalTo(contentView).offset(-128)
            make.bottom.equalTo(contentView).offset(-100)
        }
        
    }
}


