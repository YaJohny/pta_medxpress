//
//  TopRankedTabTableViewCell.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class TopRankedTabTableViewCell: UITableViewCell {

    lazy var subView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "FAFAFC")
        view.layer.cornerRadius = 16
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Pediatrician | Mercy Hospital"
        label.textColor = UIColor(hex: "AAB6C3")
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var bookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Book Appointment", for: .normal)
        button.setTitleColor(UIColor(hex: "2E6FF3"), for: .normal)
        button.backgroundColor = UIColor(hex: "E9F0FF")
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    lazy var rankingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.8"
        label.textColor = UIColor(hex: "33384B")
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
    
    lazy var calendarLabel: UILabel = {
        let label = UILabel()
        label.text = "10:30am - 5:30pm"
        label.textColor = UIColor(hex: "33384B")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        self.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
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
        
        subView.addSubview(bookButton)
        bookButton.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.bottom).offset(60)
            make.bottom.right.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        subView.addSubview(jobLabel)
        jobLabel.snp.makeConstraints { make in
            make.top.equalTo(personLabel.snp.bottom).offset(5)
            make.left.right.equalTo(personLabel)
        }
        
        subView.addSubview(rankingLabel)
        rankingLabel.snp.makeConstraints { make in
            make.left.equalTo(jobLabel)
            make.width.equalTo(30)
            make.top.equalTo(jobLabel.snp.bottom).offset(5)
        }
        
        
        subView.addSubview(starImageView)
        starImageView.snp.makeConstraints { make in
            make.left.equalTo(rankingLabel.snp.right).offset(4)
            make.centerY.equalTo(rankingLabel)
            make.height.width.equalTo(16)
        }
        
        subView.addSubview(calendarImageView)
        calendarImageView.snp.makeConstraints { make in
            make.left.equalTo(starImageView.snp.right).offset(30)
            make.centerY.equalTo(starImageView)
            make.height.width.equalTo(18)
        }
        
        subView.addSubview(calendarLabel)
        calendarLabel.snp.makeConstraints { make in
            make.left.equalTo(calendarImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(calendarImageView)
        }
    }

}
