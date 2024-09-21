//
//  SearchViewController.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    var isLoading: Bool = false

    var doctors = [Doctor]()
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    var cancelWidthEn: CGFloat = 60
    
    lazy var searchIconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 7, y: 4, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "magnifyingglass")
        return imageView
    }()
    
    lazy var largeTitlesLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var searchtextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 40 / 2
        textField.backgroundColor = .systemGray6
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftView.addSubview(searchIconImageView)
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.delegate = self
        textField.autocorrectionType = .no
        
        let placeholderText = "Search for a doctor"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        let attributes2: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
        let attributedText = NSAttributedString(string: "", attributes: attributes2)
        textField.attributedText = attributedText
        textField.tintColor = UIColor.label
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopRankedTabTableViewCell.self, forCellReuseIdentifier: String.init(describing: TopRankedTabTableViewCell.self))
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    @objc func cancelButtonTapped() {
        view.endEditing(true)
        fetchTopRated()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
        
        fetchTopRated()
    }
    
    private func fetchTopRated() {
        if !isLoading {
            isLoading = true
            self.showLoadingViewX()       
        }
        NetworkManager.shared.getTopRatedDoctors { [weak self] doctors in
            guard let self = self else { return }
            if self.isLoading {
                self.dissmissLoadingViewX()
                self.isLoading = false
            }
            if let doctors = doctors {
                self.doctors = doctors
                for doctor in doctors {
                    print("Doctor: \(doctor.fullName), Ranking: \(doctor.ranking)")
                }
                self.tableView.reloadData()
            } else {
                print("Failed to retrieve doctors.")
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, text.replacingOccurrences(of: " ", with: "") != "" {
            searchDoctors(query: text) { [weak self] doctors in
                guard let self = self else { return }
                self.doctors = doctors ?? []
                self.tableView.reloadData()
            }
        } else {
            fetchTopRated()
        }
    }
    func searchDoctors(query: String, completion: @escaping ([Doctor]?) -> Void) {
        let url = "https://852e-84-54-114-148.ngrok-free.app/api/Doctor/Search?text=\(query)"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UD.token!)"
        ]
        
        if !isLoading {
            isLoading = true
            self.showLoadingViewX()
        }
        AF.request(url, method: .post, headers: headers).responseDecodable(of: [Doctor].self) { response in
            if self.isLoading {
                self.dissmissLoadingViewX()
                self.isLoading = false
            }
            switch response.result {
            case .success(let doctors):
                completion(doctors)
            case .failure(let error):
                print("Failed to search doctors: \(error)")
                completion(nil)
            }
        }
    }
        
    lazy var textFieldBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private func initViews() {
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        subView.addSubview(tableView)
        subView.addSubview(largeTitlesLabel)
        subView.addSubview(textFieldBackView)
        subView.addSubview(searchtextField)
        subView.addSubview(cancelButton)
        
     

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchtextField.snp.bottom).offset(-20)
            make.left.right.bottom.equalToSuperview()
        }
        
        textFieldBackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(searchtextField)
            make.bottom.equalTo(searchtextField.snp.bottom).offset(5)
        }
        
        largeTitlesLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
//        searchtextField.delegate = self
        searchtextField.snp.makeConstraints { make in
            make.top.equalTo(largeTitlesLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.left.equalTo(view.snp.right)
            make.centerY.equalTo(searchtextField)
            make.height.equalTo(40)
        }
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: TopRankedTabTableViewCell.self), for: indexPath) as? TopRankedTabTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let doctor = doctors[indexPath.row]
        cell.personLabel.text = "\(doctor.firstName) \(doctor.lastName)"
        cell.jobLabel.text = "\(doctor.specializationArea) | \(doctor.workPlace)"
        cell.rankingLabel.text = "\(doctor.ranking)"
        cell.calendarLabel.text = "\(doctor.email)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.largeTitlesLabel.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-40)
            }
            self.largeTitlesLabel.alpha = 0
            
            self.searchtextField.snp.updateConstraints { make in
                make.right.equalToSuperview().offset(-CGFloat(self.cancelWidthEn + 30))
            }
            
            self.cancelButton.snp.updateConstraints { make in
                make.left.equalTo(self.view.snp.right).offset(-CGFloat(self.cancelWidthEn + 20))
            }
            
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.largeTitlesLabel.snp.updateConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            }
            self.largeTitlesLabel.alpha = 1
            
            self.searchtextField.snp.updateConstraints { make in
                make.right.equalToSuperview().offset(-20)
                
            }
            
            self.cancelButton.snp.updateConstraints { make in
                make.left.equalTo(self.view.snp.right)
            }
            
            self.view.layoutIfNeeded()
        }
    }
}
