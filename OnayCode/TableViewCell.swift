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

    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        imageView.backgroundColor = .systemBlue
        return imageView
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = UIColor(hex: "677FFF")
        view.layer.cornerRadius = 1
        view.clipsToBounds = true
        return view
    }()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
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

    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.tintColor = .green
        progressView.progress = 0.5
        progressView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        return progressView
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

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let shapeStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
//        stackView.backgroundColor = .systemCyan
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
//        stackView.backgroundColor = .systemRed

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            shapeStackview.widthAnchor.constraint(equalToConstant: 16),

            labelStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            labelStackView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -16),

            progressStackView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 16),
            progressStackView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -16),
            progressStackView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 16),

            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xFF0000) >> 16
        let g = (rgbValue & 0xFF00) >> 8
        let b = rgbValue & 0xFF

        self.init(red: CGFloat(r) / 0xFF, green: CGFloat(g) / 0xFF, blue: CGFloat(b) / 0xFF, alpha: 1)
    }
}
