//
//  NewSavedViewController.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit

class NewSavedViewController: UIViewController {
    
    var appointments = [Appointment]()
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(NewSavedTableViewCell.self, forCellReuseIdentifier: String.init(describing: NewSavedTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        title = "Appointments"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        
        fetchUpcoming()
    }
    
    private func fetchUpcoming() {
        let id = 0
        self.showLoadingViewX()
        NetworkManager.shared.getUpcomingAppointments(userId: 0) { [weak self] appointments in
            guard let self = self else { return }
            self.dissmissLoadingViewX()
            if let appointments = appointments {
                self.appointments = appointments
                for appointment in appointments {
                    print("Appointment ID: \(appointment.id), User: \(appointment.timeFrame.doctor.fullName), Doctor: \(appointment.timeFrame.doctor.email)")
                }
                self.tableView.reloadData()
            } else {
                print("Failed to retrieve appointments.")
            }
        }
    }
}

extension NewSavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: NewSavedTableViewCell.self), for: indexPath) as? NewSavedTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let doctor = appointments[indexPath.row].timeFrame.doctor
        cell.personLabel.text = "\(doctor.firstName) \(doctor.lastName)"
        cell.jobLabel.text = "\(doctor.specializationArea) | \(doctor.workPlace)"
//        cell.rankingLabel.text = "\(doctor.ranking)"
//        cell.dateLabel.text = "22 Sep"
//        cell.timeLabel.text = appointments[indexPath.row].timeFrame.startDate
        return cell
    }
}
