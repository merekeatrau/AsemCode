//
//  TableViewCell.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseIdentifier = "TableCell"

    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.tintColor = .green
        progressView.progress = 0.5
        progressView.backgroundColor = .white
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        return progressView
    }()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subheaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Basic"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let progressStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(labelStackView)
        backgroundImageView.addSubview(progressStackView)
        backgroundImageView.addSubview(progressView)
        labelStackView.addArrangedSubview(headerLabel)
        labelStackView.addArrangedSubview(subheaderLabel)
        progressStackView.addArrangedSubview(progressView)
        progressStackView.addArrangedSubview(progressLabel)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            labelStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            labelStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -16),

            progressStackView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 16),
            progressStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            progressStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),

        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
