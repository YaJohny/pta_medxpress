//
//  MainCateforyCollectionViewCell.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class MainCateforyCollectionViewCell: UICollectionViewCell {
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cadiologist")
        return imageView
    }()
    
    lazy var personLabel: UILabel = {
        let label = UILabel()
        label.text = "Heart"
        label.textAlignment = .center
        label.textColor = UIColor(hex: "7D8A95")
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        contentView.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        subView.layer.cornerRadius = 16
        subView.backgroundColor = UIColor(hex: "F0F4FC")
        
        
        subView.addSubview(accountImageView)
        accountImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.width.height.equalTo(28)
            make.centerX.equalToSuperview()
        }
        
        subView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(accountImageView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
        }
    }
    
    
}
