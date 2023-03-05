//
//  QuizHeader.swift
//  OnayCode
//
//  Created by Artyom Prima on 05.03.2023.
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
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 40, y: 37), radius: 27, startAngle: -.pi / 2, endAngle: 2 * .pi, clockwise: true)
        
        // Create a shape layer for the path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.1632157564, green: 0.6325275302, blue: 0.8594981432, alpha: 1)
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        // Add the shape layer to the view's layer
        ellipseFull.layer.addSublayer(shapeLayer)
        
        // Animate the stroke end property of the shape layer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.8
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "progress")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let orangeView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "orange")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "left"), for: .normal)
        button.addTarget( nil, action: #selector(turnBack), for: .touchUpInside)
        return button
    }()
    
    @objc func turnBack() {
        didBackTapped?()
        print("tap")
    }
    
    private let ellipseFirst: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ellipseFirst")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let ellipseSecond: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ellipseSecond")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let ellipseFull: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ellipse")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
   private let backgroundOrangeCircle: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let viewForText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.text = " What side you're on."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func addSubviews() {
        contentView.addSubview(backgroundOrangeCircle)
        contentView.addSubview(orangeView)
        orangeView.addSubview(viewForText)
        orangeView.addSubview(buttonBack)
        orangeView.addSubview(ellipseFirst)
        ellipseFirst.addSubview(ellipseSecond)
        ellipseSecond.addSubview(ellipseFull)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        backgroundOrangeCircle.topAnchor.constraint(equalTo: contentView.topAnchor),
        backgroundOrangeCircle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        backgroundOrangeCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
        orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
        orangeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
        buttonBack.topAnchor.constraint(equalTo: orangeView.topAnchor, constant: 16),
        buttonBack.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 16),
        
        ellipseFirst.topAnchor.constraint(equalTo: orangeView.topAnchor, constant: 40),
        ellipseFirst.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: -128),
        ellipseFirst.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 128),

        ellipseSecond.centerXAnchor.constraint(equalTo: ellipseFirst.centerXAnchor),
        ellipseSecond.centerYAnchor.constraint(equalTo: ellipseFirst.centerYAnchor),
        
        ellipseFull.centerXAnchor.constraint(equalTo: ellipseSecond.centerXAnchor),
        ellipseFull.centerYAnchor.constraint(equalTo: ellipseSecond.centerYAnchor),
        
        viewForText.topAnchor.constraint(equalTo: orangeView.topAnchor, constant: 104),
        viewForText.bottomAnchor.constraint(equalTo: orangeView.bottomAnchor, constant: -18),
        viewForText.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor, constant: -16),
        viewForText.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 16),
        ])
    }
}
