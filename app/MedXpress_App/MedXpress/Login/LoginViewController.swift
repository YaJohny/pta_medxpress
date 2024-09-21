//
//  LoginViewController.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Email"
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 1
        textField.layer.cornerRadius = 40 / 2
        textField.backgroundColor = UIColor(hex: "F9F9F9")

        textField.rightViewMode = .always
        textField.autocorrectionType = .no
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftViewMode = .always
        
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 2.0
        let placeholderText = "Email"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.tintColor = UIColor.label
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Password"
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var searchIconImageView2: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "eye.slash.fill")
        return imageView
    }()
    
    @objc func eyeButtonTapped() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            searchIconImageView2.image = UIImage(systemName: "eye.fill")
        } else {
            passwordTextField.isSecureTextEntry = true
            searchIconImageView2.image = UIImage(systemName: "eye.slash.fill")
        }
    }
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 1
        textField.layer.cornerRadius = 40 / 2
        textField.backgroundColor =  UIColor(hex: "F9F9F9")
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        leftView.addSubview(searchIconImageView2)
        
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eyeButtonTapped)))
        leftView.isUserInteractionEnabled = true
        
        textField.rightView = leftView
        textField.rightViewMode = .always
        textField.autocorrectionType = .no
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftViewMode = .always
        
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 2.0
        textField.isSecureTextEntry = true
        
        let placeholderText = "Enter a password"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.tintColor = UIColor.label
        return textField
    }()
    
    lazy var mainButton: MainButton = {
        let button = MainButton(title: "Continue")
//        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()

    @objc func viewTapped() {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tap)
        
        
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white

        view.addSubview(subView)
        
        // Align subView to the bottom of the navigation bar using safe area
        subView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        subView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        subView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.left.right.equalTo(emailLabel)
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.height.equalTo(55)
        }
        
        subView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.left.right.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
        
        subView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.right.equalTo(passwordLabel)
            make.top.equalTo(passwordLabel.snp.bottom).offset(9)
            make.height.equalTo(60)
        }
        
        subView.addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20 - getBottomSafeAreaHeight())
            make.height.equalTo(55)
        }
        mainButton.layer.cornerRadius = 55.0 / 2
        
        
        mainButton.addPressAnimation() { [weak self] in
            guard let self = self else { return }
            self.loginTapped()
        }
    }
    
    func loginTapped() {
        self.showLoadingViewX()
        if let email = emailTextField.text, let password = passwordTextField.text {
            NetworkManager.shared.login(email: email, password: password) { token in
                self.dissmissLoadingViewX() // Corrected spelling
                if let token = token {
                    UD.token = token
                    UD.email = email
                    self.setNewRootViewController()
                    print("Received Token: \(token)")
                } else {
                    self.showAlert(message: "Login or password is wrong.")
                    print("Failed to get token")
                }
            }
        }
    }
    
}


extension UIViewController {
    func goLoginPage() {
        let newRootViewController = OnboardViewController()
        if let sceneDelegate = SceneDelegate.shared {
            sceneDelegate.window?.rootViewController = newRootViewController
        }
    }
    
}

extension UIView {
    

    func addPressAnimation(completion: (() -> Void)? = nil) {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handlePressAnimation(_:)))
        longPressRecognizer.minimumPressDuration = 0
        self.addGestureRecognizer(longPressRecognizer)
        self.isUserInteractionEnabled = true
        self.pressAnimationCompletion = completion
    }
    
    @objc private func handlePressAnimation(_ gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            animateScaleDown()
        case .ended, .cancelled, .failed:
            animateScaleUp()
        default:
            break
        }
    }
    
    private func animateScaleDown() {
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: .curveLinear,
            animations: { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            },
            completion: nil
        )
    }
    
    private func animateScaleUp() {
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: .curveLinear,
            animations: { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 1, y: 1)
            },
            completion: { [weak self] _ in
                self?.isUserInteractionEnabled = true
                self?.pressAnimationCompletion?()
            }
        )
    }
    
    private struct AssociatedKeys {
        static var completionBlockKey = "pressAnimationCompletion"
    }
    
    private var pressAnimationCompletion: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.completionBlockKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.completionBlockKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


class MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "2E6FF3")
        self.layer.cornerRadius = 18
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(hex: "2E6FF3")
        self.layer.cornerRadius = 18
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIViewController {
    func setNewRootViewController() {
        let newRootViewController = MainTabBarController()
        if let sceneDelegate = SceneDelegate.shared {
            sceneDelegate.window?.rootViewController = newRootViewController
        }
    }
}


extension UIViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Failure", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
