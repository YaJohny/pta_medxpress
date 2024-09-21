//
//  MainCollectionViewCell.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
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
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Dentist"
        label.textColor = UIColor(hex: "C0D4FB")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    lazy var rankingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.8"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star")
        return imageView
    }()
    
    lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Calender")
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Oct"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    lazy var timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Time")
        return imageView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "10:30pm"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
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
        subView.backgroundColor = UIColor(hex: "2E6FF3")
        
        subView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.height.width.equalTo(32)
        }
        
        accountView.addSubview(accountImageView)
        accountImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(personLabel)
        personLabel.snp.makeConstraints { make in
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(accountView)
        }
        
        subView.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { make in
            make.left.equalTo(accountView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(personLabel.snp.bottom).offset(4)
        }
        
        subView.addSubview(rankingLabel)
        rankingLabel.snp.makeConstraints { make in
            make.left.equalTo(jobLabel)
            make.top.equalTo(jobLabel.snp.bottom).offset(4)
            make.width.equalTo(30)
        }
        
        subView.addSubview(starImageView)
        starImageView.snp.makeConstraints { make in
            make.left.equalTo(rankingLabel.snp.right).offset(4)
            make.centerY.equalTo(rankingLabel)
            make.height.width.equalTo(16)
        }
        
        subView.addSubview(calendarImageView)
        calendarImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.width.equalTo(18)
        }
        
        subView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(calendarImageView.snp.right).offset(8)
            make.right.equalTo(self.snp.centerX)
            make.centerY.equalTo(calendarImageView)
        }
        
        subView.addSubview(timeImageView)
        timeImageView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.centerX).offset(0)
            make.bottom.equalToSuperview().offset(-16)
            make.height.width.equalTo(18)
        }
        
        subView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(timeImageView.snp.right).offset(8)
            make.right.equalToSuperview()
            make.centerY.equalTo(timeImageView)
        }
    }

}
