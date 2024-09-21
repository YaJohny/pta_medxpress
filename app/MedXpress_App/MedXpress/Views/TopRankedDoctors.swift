//
//  TopRankedDoctors.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class TopRankView: UIView {
    
    var topRatedDoctors = [Doctor]() {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Ranked Doctors"
        label.textColor = UIColor(hex: "33384B")
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopRankedTabTableViewCell.self, forCellReuseIdentifier: String.init(describing: "TopRankedTabTableViewCell"))
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
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
        
        subView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(30)
        }
        
        subView.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(10 * 180)
            make.bottom.equalToSuperview()
        }
    }
}

extension TopRankView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopRankedTabTableViewCell", for: indexPath) as? TopRankedTabTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        let doctor = topRatedDoctors[indexPath.row]
        cell.personLabel.text = "\(doctor.firstName) \(doctor.lastName)"
        cell.jobLabel.text = "\(doctor.specializationArea) | \(doctor.workPlace)"
        cell.rankingLabel.text = "\(doctor.ranking)"
        cell.calendarLabel.text = "\(doctor.email)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topRatedDoctors.count
    }
}
