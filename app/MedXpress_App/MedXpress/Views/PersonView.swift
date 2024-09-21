//
//  PersonView.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

protocol PersonViewDelegate: AnyObject {
    func searchTapped()
}

class PersonView: UIView {
    
    weak var delegate: PersonViewDelegate?
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var accountView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 48.0 / 2
        return view
    }()
    
    lazy var acooountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pic")
        return imageView
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back"
        label.textColor = UIColor(hex: "33384B")
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var personNameLabel: UILabel = {
        let label = UILabel()
        label.text = UD.email ?? ""
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Favorite")
        imageView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(searchTapped))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    @objc func searchTapped() {
        delegate?.searchTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        self.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(48)
            make.bottom.equalToSuperview()
        }
        
        accountView.addSubview(acooountImageView)
        acooountImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(accountView.snp.top)
        }
        
        subView.addSubview(personNameLabel)
        personNameLabel.snp.makeConstraints { make in
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(accountView.snp.bottom)
        }
        
        subView.addSubview(heartImageView)
        heartImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.centerY.equalTo(acooountImageView)
            make.height.width.equalTo(25)
        }
    }
}
