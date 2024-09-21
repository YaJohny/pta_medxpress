//
//  File.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//

import UIKit
import SnapKit

class WelcomeScreenCell: UICollectionViewCell {
    
    static let identifier = "WelcomeScreenCell"
    var nextbuttonAction: (() -> Void)?
    var skipbuttonAction: (() -> Void)?
    var music: String = ""
        
    lazy var mainLabel = MainLabel(text: "Welcome !", textColor: Colors.labelColor, textAlignment: .center, font: UIFont.systemFont(ofSize: 28, weight: .semibold))
    
    lazy var descriptionLabel = MainLabel(text: "Bizning bu ilova mahsulot Halol, Harom yoki Makruh ekanligini aytib beradi", textColor: Colors.labelColor,textAlignment: .center, font: UIFont.systemFont(ofSize: 16,  weight: .medium))

    lazy var circleImageView = MainImageView(image: UIImage(named: "Audio call")!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(items: Onboard) {
        circleImageView.image = items.circleImage
        mainLabel.text = items.text
        mainLabel.font = UIFont.systemFont(ofSize: 25)
        descriptionLabel.text = items.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    @objc private func nextButtonTapped() {
        nextbuttonAction?()
    }
    
    @objc func skipButtonTapped() {
        skipbuttonAction?()
    }
    
    
    private func configureUI() {
        contentView.backgroundColor = .clear
        descriptionLabel.setLineSpacing(lineSpacing: 4.5)
        descriptionLabel.textAlignment = .center
    }
    
    private func addSubviews() {
        contentView.addSubview(circleImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(descriptionLabel)
    }

    private func setConstraints() {
        circleImageView.snp.makeConstraints { make in
            make.top.equalTo(UIScreen.main.bounds.height / 8)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
            make.height.equalTo(circleImageView.snp.width).multipliedBy(1.4)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(30)
            make.trailing.equalTo(contentView).offset(-30)
            make.top.equalTo(circleImageView.snp.bottom).offset(50)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
    }

}

