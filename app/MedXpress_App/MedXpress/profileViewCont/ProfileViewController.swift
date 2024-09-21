//
//  ProfileViewController.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 22/09/24.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TopViewDelegate, ProfileTableViewCellDelegate {
    func profileTapped() {
        let alertController = UIAlertController(title: "Log out", message: "Do you want to log out?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Log out", style: .destructive) { (action) in
            UD.token = ""
            UD.mode = ""
            self.goLoginPage()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    let topView = TopView()
    
    lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: String.init(describing: ProfileTableViewCell.self))
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        initViews()
    }
    
    private func initViews() {
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: ProfileTableViewCell.self), for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        topView.delegate = self
        topView.setImage(image: UIImage(named: "Pic")!)
        return topView
    }
}
