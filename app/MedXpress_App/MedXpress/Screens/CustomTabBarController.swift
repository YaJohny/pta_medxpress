//
//  File.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//


import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private var shapeLayer: CAShapeLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        
        let nc1 = HomeViewController()
        let nc2 = SearchViewController()
        let nc3 = UINavigationController(rootViewController: NewSavedViewController())
        let nc4 = UINavigationController(rootViewController: NewSavedViewController())
        let nc5 = UINavigationController(rootViewController: ProfileViewController())
        

        nc1.title = "Home"
        nc2.title = "Search"
        nc4.title = "Appointments"
        nc5.title = "Profile"
                
        nc1.tabBarItem.image = UIImage.init(named: "Home")
        nc2.tabBarItem.image = UIImage.init(named: "magnifyingglass")
        
        nc4.tabBarItem.image = UIImage(named: "t3")
        nc5.tabBarItem.image = UIImage(named: "Profil")
        nc3.tabBarItem.tag = 2
        
        tabBar.tintColor = UIColor.init(hex: "00F0FF")
        self.delegate = self
        setViewControllers([nc1, nc2, nc3, nc4], animated: true)
        
        
        tabBar.tintColor = Colors.greenColor
        self.delegate = self
        setViewControllers([nc1, nc2, nc3, nc4, nc5], animated: true)
        setupMiddleButton()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.backgroundColor = .clear
        tabBar.unselectedItemTintColor = UIColor(named: "tabbarbutton")
        UITabBar.appearance().layer.cornerRadius = 30
        UITabBar.appearance().layer.borderColor = UIColor.black.cgColor
        UITabBar.appearance().layer.borderWidth = 1
        addTabBarShadowBG()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.clipsToBounds = false
    }

    
    private func addTabBarShadowBG() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor(named: "tabbar")?.cgColor
        shapeLayer.strokeColor = UIColor.systemGray6.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.shouldRasterize = true
        shapeLayer.rasterizationScale = UIScreen.main.scale
        if let oldShapeLayer = self.shapeLayer {
            tabBar.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            tabBar.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    func createPath() -> CGPath {
           let height: CGFloat = 74
           let path = UIBezierPath()
           let centerWidth = tabBar.frame.width / 2
           path.move(to: CGPoint(x: 0, y: 0))
           path.addLine(to: CGPoint(x: (centerWidth - height), y: 0))
           path.addCurve(to: CGPoint(x: centerWidth, y: height / 2),
                         controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height / 2))
           path.addCurve(to: CGPoint(x: (centerWidth + height), y: 0),
                         controlPoint1: CGPoint(x: centerWidth + 35, y: height / 2), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
           path.addLine(to: CGPoint(x: tabBar.frame.width, y: 0))
           path.addLine(to: CGPoint(x: tabBar.frame.width, y: tabBar.frame.height))
           path.addLine(to: CGPoint(x: 0, y: tabBar.frame.height))
           path.close()
           return path.cgPath
       }
    
    let menuButton = ActualGradientButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))

    func setupMiddleButton() {
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(tabBar.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(64)
        }

         //menuButton.backgroundColor = UIColor.init(hex: "6980FD")
         menuButton.layer.cornerRadius = 32

        let image = UIImage(named: "Ai")?.withTintColor(.white)
        menuButton.imageView?.tintColor = .white
        menuButton.setImage(image, for: .normal)
        menuButton.contentVerticalAlignment = .fill
        menuButton.contentHorizontalAlignment = .fill
        menuButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        menuButton.imageView?.contentMode = .scaleAspectFit
        view.layoutIfNeeded()
     }
    
    @objc func menuButtonAction(sender: UIButton) {
        Vibration.medium.vibrate()
        DispatchQueue.main.async {
                   let alertVC = UINavigationController(rootViewController: CallAIViewController())
            alertVC.modalPresentationStyle  = .fullScreen
                   alertVC.modalTransitionStyle    = .coverVertical
                   self.present(alertVC, animated: true)
               }
    }
    
    @objc func dismissRegisterViewController() {
        self.dismiss(animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let tagValue = viewController.tabBarItem.tag
        if tagValue == 2 {
            return false
        }
        return true
    }
}


class ActualGradientButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        
        // Define your gradient stops here
        gradient.colors = [
            Colors.greenColor.cgColor,
            Colors.greenColor.cgColor,
        ]
        
        // Define your gradient start and end points here
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        // Set the corner radius
        gradient.cornerRadius = 32
        
        // Insert the gradient layer as the background
        layer.insertSublayer(gradient, at: 0)
        
        return gradient
    }()
}


extension UITabBarController{
    func getHeight()->CGFloat{
        return self.tabBar.frame.size.height
    }

    func getWidth()->CGFloat{
         return self.tabBar.frame.size.width
    }
}
