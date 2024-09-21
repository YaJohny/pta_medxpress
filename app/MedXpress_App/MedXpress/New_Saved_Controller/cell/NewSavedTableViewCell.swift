//
//  NewSavedTableViewCell.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class NewSavedTableViewCell: UITableViewCell {

    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var accountView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pic (1)")
        return imageView
    }()
    
    lazy var personLabel: UILabel = {
        let label = UILabel()
        label.text = "Jason Smith"
        label.textColor = UIColor(hex: "33384B")
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Psychologists"
        label.textColor = UIColor(hex: "7D8A95")
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Video call"), for: .normal)
        button.addTarget(self, action: #selector(cameraButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func cameraButtonTapped() {
        print("XXXXXX")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        subView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.width.equalTo(48)
        }
        
        accountView.addSubview(accountImageView)
        accountImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(accountView).offset(-3)
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        subView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.top.equalTo(accountView).offset(-3)
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        subView.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { make in
            make.bottom.equalTo(accountView).offset(3)
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        subView.addSubview(cameraButton)
        cameraButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
    
}
