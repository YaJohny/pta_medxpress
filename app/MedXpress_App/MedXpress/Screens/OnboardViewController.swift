//
//  OnboardViewController.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//

import UIKit
import UIKit

struct Onboard: Equatable {
    let circleImage: UIImage?
    let image: UIImage?
    let text: String
    let description: String
}


class OnboardViewController: UIViewController {
    
    var index2 = 0
    var index1 = 0
    
    var onBoardData: [Onboard] = [
        Onboard(circleImage: UIImage(named: "Audio call"), image: UIImage(named: "onboard1"), text: "Get medical advice from AI.", description: "It is free of charge and takes no time."),
        Onboard(circleImage: UIImage(named: "Chat option"), image: UIImage(named: "onboard2"), text: "Schedule a appointment with doctors", description: "Make a appointment and get real-time consultation from doctors."),
    ]
    
    lazy var myButton = MainButton(title: "Continue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.tintColor = .systemGreen
        setupView()
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        navigationItem.hidesBackButton = true
    }
    
    @objc func buttonTapped(sender: UIButton) {
      sender.showAnimation {
          self.index1 += 1
          self.scrollToNextCell()
        //Write code which you want to execute after button tapped.
        //use weak self here
          //self.navigationController?.pushViewController(OnboardViewController(), animated: true)
      }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collec = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collec.register(WelcomeScreenCell.self, forCellWithReuseIdentifier: WelcomeScreenCell.identifier)
        collec.backgroundColor = .clear
        collec.showsHorizontalScrollIndicator = false
        collec.delegate = self
        collec.dataSource = self
        collec.isPagingEnabled = true
        return collec
    }()
    
    lazy var pagingView: UIPageControl = {
        let p = UIPageControl()
        p.numberOfPages = onBoardData.count
        p.currentPageIndicatorTintColor = Colors.greenColor
        p.pageIndicatorTintColor = UIColor.systemGray5
        return p
    }()
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pagingView.currentPage = Int(pageNumber)
    }
    
    
    
    private func setupView() {
        view.addSubview(myButton)
        myButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(30)
            make.trailing.equalTo(view).offset(-30)
            make.bottom.equalTo(view).offset(-50)
            make.height.equalTo(55)
        }
        
        view.addSubview(pagingView)
        pagingView.anchor(top: nil, leading: nil, bottom: myButton.topAnchor, trailing: nil,padding: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0), size: CGSize(width: 150, height: 20))
        pagingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: pagingView.topAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}


extension OnboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeScreenCell.identifier, for: indexPath) as! WelcomeScreenCell
        let data = onBoardData[indexPath.item]
        cell.setData(items: data)
        cell.skipbuttonAction = { [weak self] in
            let vc = UIViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.nextbuttonAction = { [weak self] in
                self?.scrollToNextCell()
        }
        
    return cell
}
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pagingView.currentPage = Int(pageNumber)
        if Int(pageNumber) != index2 {
            index2 = Int(pageNumber)
        }
    }

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: collectionView.frame.height)
}
    
    func scrollToNextCell(){
        if index1 == 2 {
            let appDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate

            let initialViewController = UINavigationController(rootViewController: LoginViewController())
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
            UD.isOnboard = true
            return
        }
        //get cell size
        let cellSize = CGSize(width:self.view.frame.size.width, height:collectionView.frame.size.height)


        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset;

        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width
        {
            collectionView.scrollRectToVisible(CGRect(x:0, y:contentOffset.y, width:cellSize.width, height:cellSize.height), animated: true);

        } else {
            
            collectionView.scrollRectToVisible(CGRect(x:contentOffset.x + cellSize.width, y:contentOffset.y, width:cellSize.width, height:cellSize.height), animated: true);
            
        }
    }
}


struct OnBoardDataModel {
    let imageName: String
    let title: String
    let definition: String
}
