//
//  TableViewCell.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "TableCell"

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "circle"))
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return imageView
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.layer.cornerRadius = 1
        view.clipsToBounds = true
        return view
    }()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    let subheaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Basic"
        return label
    }()

    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.tintColor = .green
        progressView.progress = 0.5
        progressView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true
        progressView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        return progressView
    }()

    let progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()

    let shapeStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)

        backgroundImageView.addSubview(labelStackView)
        backgroundImageView.addSubview(progressStackView)

        labelStackView.addArrangedSubview(headerLabel)
        labelStackView.addArrangedSubview(subheaderLabel)

        shapeStackview.addArrangedSubview(iconImageView)
        shapeStackview.addArrangedSubview(separatorView)

        progressStackView.addArrangedSubview(progressView)
        progressStackView.addArrangedSubview(progressLabel)

        stackView.addArrangedSubview(shapeStackview)
        stackView.addArrangedSubview(backgroundImageView)
        selectionStyle = .none
        let padding: CGFloat = 16.0

        shapeStackview.snp.makeConstraints {
            $0.width.equalTo(16)
        }

        labelStackView.snp.makeConstraints { make in
            make.leading.equalTo(backgroundImageView.snp.leading).offset(padding)
            make.trailing.equalTo(backgroundImageView.snp.trailing).offset(-padding)
            make.bottom.equalTo(backgroundImageView.snp.bottom).offset(-padding)
        }

        progressStackView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.top).offset(padding)
            make.leading.equalTo(backgroundImageView.snp.leading).offset(padding)
            make.trailing.equalTo(backgroundImageView.snp.trailing).offset(-padding)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).offset(-padding)
            make.bottom.equalTo(contentView.snp.bottom).offset(-padding)
        }
    }

    func config(with cardInfo: Card, isFirstCell: Bool) {
        headerLabel.text = cardInfo.header
        subheaderLabel.text = cardInfo.subheader
        backgroundImageView.image = cardInfo.bgImage
        let result = Double(cardInfo.progress) ?? 0.0 / 100.0
        progressLabel.text = cardInfo.progress + "%"
        progressView.progress = Float(result / 100)

        if isFirstCell {
            iconImageView.image = UIImage(named: "circle")
            separatorView.backgroundColor = UIColor(hex: "677FFF")
        } else {
            iconImageView.image = UIImage(named: "padlock")
            separatorView.backgroundColor = .systemGray
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xFF0000) >> 16
        let g = (rgbValue & 0xFF00) >> 8
        let b = rgbValue & 0xFF

        self.init(red: CGFloat(r) / 0xFF, green: CGFloat(g) / 0xFF, blue: CGFloat(b) / 0xFF, alpha: 1)
    }
}

