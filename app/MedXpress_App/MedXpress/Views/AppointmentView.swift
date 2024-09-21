//
//  AppointmentView.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class AppointmentView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var appointments = [Appointment]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming Appointments"
        label.textColor = UIColor(hex: "33384B")
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    var collectionView: UICollectionView!


    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // Set the scroll direction to horizontal
        layout.itemSize = CGSize(width: 220, height: 132)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
              
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false // Optional: Hide the scroll indicator
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
              
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(132)
            make.bottom.equalToSuperview()
        }
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
            make.top.equalToSuperview().offset(40)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appointments.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! MainCollectionViewCell
         let doctor = appointments[indexPath.row].timeFrame.doctor
         cell.personLabel.text = "\(doctor.firstName) \(doctor.lastName)"
         cell.jobLabel.text = "\(doctor.specializationArea) | \(doctor.workPlace)"
         cell.rankingLabel.text = "\(doctor.ranking)"
         cell.dateLabel.text = "22 Sep"
         cell.timeLabel.text = appointments[indexPath.row].timeFrame.startDate
         return cell
     }
}

