//
//  ProfileTableViewCell.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 22/09/24.
//

import UIKit

protocol ProfileTableViewCellDelegate: AnyObject {
    func profileTapped()
}


class ProfileTableViewCell: UITableViewCell {
    
    weak var delegate: ProfileTableViewCellDelegate?

    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var balanceView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(hex: "F0F4FC")
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Balans: "
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var summaLabel: UILabel = {
        let label = UILabel()
        label.text = "0 so'm"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var scoreView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "F0F4FC")
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: "
        return label
    }()
    
    lazy var scoresummaLabel: UILabel = {
        let label = UILabel()
        label.text = "320 points"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var mainButton: MainButton = {
        let button = MainButton()
        button.setTitle("Log out", for: .normal)
        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
        
        mainButton.addPressAnimation() { [weak self] in
            guard let self = self else { return }
            self.delegate?.profileTapped()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        contentView.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(balanceView)
        balanceView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(self.snp.centerX).offset(-10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(120)
        }
        
        balanceView.addSubview(balanceLabel)
        balanceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
        }
        
        balanceView.addSubview(summaLabel)
        summaLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(balanceLabel.snp.bottom).offset(10)
        }
        
        subView.addSubview(scoreView)
        scoreView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.left.equalTo(self.snp.centerX).offset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(120)
        }
        
        scoreView.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(20)
        }
        
        scoreView.addSubview(scoresummaLabel)
        scoresummaLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(scoreLabel.snp.bottom).offset(10)
        }
        
        subView.addSubview(mainButton)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        mainButton.layer.cornerRadius = 55.0 / 2
        mainButton.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(55)
            make.bottom.equalToSuperview()
        }
    }
}

