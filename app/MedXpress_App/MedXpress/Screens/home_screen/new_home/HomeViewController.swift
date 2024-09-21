//
//  HomeViewController.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//

import UIKit

class HomeViewController: UIViewController, NewMainTableViewCellDelagate {
    
    var topRatedDoctors = [Doctor]()
    
    var appointments = [Appointment]()
    
    func searchButtonTapped() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var user: MyUser?
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(NewMainTableViewCell.self, forCellReuseIdentifier: String.init(describing: NewMainTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
        fetchTopRated()
        getMe()
        fetchUpcoming()
    }

    private func initViews() {
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        subView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func fetchTopRated() {
        self.showLoadingViewX()
        NetworkManager.shared.getTopRatedDoctors { [weak self] doctors in
            guard let self = self else { return }
            self.dissmissLoadingViewX()
            if let doctors = doctors {
                self.topRatedDoctors = doctors
                for doctor in doctors {
                    print("Doctor: \(doctor.fullName), Ranking: \(doctor.ranking)")
                }
                self.tableView.reloadData()
            } else {
                print("Failed to retrieve doctors.")
            }
        }
    }
    
    private func fetchUpcoming() {
        let id = 0
        NetworkManager.shared.getUpcomingAppointments(userId: id) { [weak self] appointments in
            guard let self = self else { return }
            if let appointments = appointments {
                self.appointments = appointments
                for appointment in appointments {
//                    print("Appointment ID: \(appointment.id), User: \(appointment.user.fullName), Doctor: \(appointment.timeFrame.doctor)")
                }
                self.tableView.reloadData()
            } else {
                print("Failed to retrieve appointments.")
            }
        }
    }
    
    private func getMe() {
        NetworkManager.shared.getUserDetails { [weak self]  user in
            guard let self = self else { return }
            if let user = user {
                
                self.tableView.reloadData()
                print("User Details: \(user.fullName), Email: \(user.email)")
            } else {
                print("Failed to retrieve user details.")
            }
        }
    }
    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: String.init(describing: NewMainTableViewCell.self)), for: indexPath) as? NewMainTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.delegate = self
        cell.topRatedDoctors = topRatedDoctors
        cell.appointments = appointments
        cell.user = user
        return cell
    }
}
