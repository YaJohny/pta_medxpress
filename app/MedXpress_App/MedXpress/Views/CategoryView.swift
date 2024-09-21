//
//  File.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class CategoryView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let categories: [String: UIImage] = ["Heart": UIImage(named: "Hepatologists")!, "Dental": UIImage(named: "Dentists")!, "Kidney": UIImage(named: "Nephrologists")!, "Stomach": UIImage(named: "Gastroenterologists")!, "Lung": UIImage(named: "Pulmonologists")!,  "Brain": UIImage(named: "Neurologists")!, "Mental": UIImage(named: "Psychiatrists")!, "Liver": UIImage(named: "Hepatologists")!]
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
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
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 50 - 30) / 4, height: 72)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
              
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false // Optional: Hide the scroll indicator
        
        collectionView.register(MainCateforyCollectionViewCell.self, forCellWithReuseIdentifier: "MainCateforyCollectionViewCell")
              
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(160)
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
            make.top.equalToSuperview().offset(30)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCateforyCollectionViewCell", for: indexPath) as! MainCateforyCollectionViewCell
         
         let categoryKeys = Array(categories.keys)
         let categoryValues = Array(categories.values)

         cell.personLabel.text = categoryKeys[indexPath.row]
         cell.accountImageView.image = categoryValues[indexPath.row]
         return cell
     }
}

