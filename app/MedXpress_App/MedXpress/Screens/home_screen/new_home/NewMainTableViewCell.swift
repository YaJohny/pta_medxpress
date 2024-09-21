//
//  NewMainTableViewCell.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

protocol NewMainTableViewCellDelagate: AnyObject {
    func searchButtonTapped()
}

class NewMainTableViewCell: UITableViewCell, PersonViewDelegate {
    func searchTapped() {
        self.delegate?.searchButtonTapped()
    }
    
    weak var delegate: NewMainTableViewCellDelagate?
    
    var topRatedDoctors = [Doctor]() {
        didSet {
            topRankView.topRatedDoctors = topRatedDoctors
        }
    }
    
    var user: MyUser? {
        didSet {
            if let user = user {
                accountView.personNameLabel.text = "\(user.firstName) \(user.lastName)"
            }
        }
    }
    
    var appointments = [Appointment]() {
        didSet {
            appointmentView.appointments = appointments
        }
    }

    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var accountView: PersonView = {
        let view = PersonView()
        view.delegate = self
        return view
    }()
    
    lazy var appointmentView: AppointmentView = {
        let view = AppointmentView()
        return view
    }()
    
    lazy var categoryView: CategoryView = {
        let view = CategoryView()
        return view
    }()
    
    lazy var topRankView: TopRankView = {
        let view = TopRankView()
        return view
    }()
    

    private func initViews() {
        contentView.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        subView.addSubview(appointmentView)
        appointmentView.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        subView.addSubview(categoryView)
        categoryView.snp.makeConstraints { make in
            make.top.equalTo(appointmentView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        subView.addSubview(topRankView)
        topRankView.snp.makeConstraints { make in
            make.top.equalTo(categoryView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
