//
//  CallAIViewController.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import UIKit
import SnapKit
import LiveKit

class CallAIViewController: UIViewController {
    
    lazy var subView: UIView = {
        let view = UIView()
        return view
    }()
    
    var timer: Timer?
    var secondsElapsed = 0
    
    lazy var backView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.setImage(UIImage(named: "03 arrow left sm")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        return view
    }()
    
    let timeLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
           label.textColor = UIColor(hex: "C0D4FB")
           label.textAlignment = .center
           label.text = "0:00"
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.image = UIImage(named: "03 arrow left sm")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        return imageView
    }()
    
    lazy var doctorAIView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var doctorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pic (2)")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var doctorLabel: UILabel = {
        let label = UILabel()
        label.text = "Doctor AI"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    lazy var cameraIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Video"), for: .normal)
        button.backgroundColor = UIColor(hex: "FFFFFF", alpha: 0.2)
        return button
    }()

    lazy var microIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Micro"), for: .normal)
        button.backgroundColor = UIColor(hex: "FFFFFF", alpha: 0.2)
        return button
    }()
    
    lazy var cancelIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "IconsCall_Hung"), for: .normal)
        button.backgroundColor = UIColor(hex: "FFFFFF", alpha: 0.2)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    lazy var room = Room(delegate: self)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        applyGradientToSubView()
        
        
        setupBackButton() // Adding back button
    }
    
    lazy var remoteVideoView: VideoView = {
        let videoView = VideoView()
        view.addSubview(videoView)
        // Additional initialization ...
        return videoView
    }()

    lazy var localVideoView: VideoView = {
        let videoView = VideoView()
        view.addSubview(videoView)
        // Additional initialization ...
        return videoView
    }()
    
    func connectToLiveKit(token: String) {
        let url = "wss://consultant-ai-weia2b76.livekit.cloud"
        Task {
            do {
                try await room.connect(url: url, token: token)
                // Connection successful...

                // Publishing camera & mic...
//                try await room.localParticipant.setCamera(enabled: true)
                try await room.localParticipant.setMicrophone(enabled: true)
            } catch {
                // Failed to connect
            }
        }
    }
    
    private func initViews() {
        view.addSubview(subView)
        subView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        makeRoom()
    }

    private func applyGradientToSubView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#2E6FF3").cgColor, UIColor(hex: "#0A43B8").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = subView.bounds
        subView.layer.insertSublayer(gradientLayer, at: 0)
        
        // To ensure the gradient layer resizes with the view:
        subView.layoutIfNeeded()
        gradientLayer.frame = subView.bounds
    }
    
    private func setupBackButton() {
        view.addSubview(backView)
        backView.backgroundColor = .clear
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    
        backView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonTapped)))
        
        view.addSubview(doctorAIView)
        doctorAIView.layer.cornerRadius = 80
        doctorAIView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(160)
        }
        
        doctorAIView.addSubview(doctorImageView)
        doctorImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(doctorLabel)
        doctorLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(doctorAIView.snp.bottom).offset(16)
        }
        
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.left.right.equalTo(doctorLabel)
            make.top.equalTo(doctorLabel.snp.bottom).offset(8)
        }
        
        view.addSubview(microIconButton)
        microIconButton.layer.cornerRadius = 32
        microIconButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.centerX.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalTo(80)
        }
        
        view.addSubview(cameraIconButton)
        cameraIconButton.layer.cornerRadius = 32
        cameraIconButton.snp.makeConstraints { make in
            make.bottom.equalTo(microIconButton)
            make.height.equalTo(64)
            make.width.equalTo(80)
            make.right.equalTo(microIconButton.snp.left).offset(-32)
        }
        
        view.addSubview(cancelIconButton)
        cancelIconButton.layer.cornerRadius = 32
        cancelIconButton.backgroundColor = UIColor(hex: "ED5E5E")
        cancelIconButton.snp.makeConstraints { make in
            make.bottom.equalTo(microIconButton)
            make.height.equalTo(64)
            make.width.equalTo(80)
            make.left.equalTo(microIconButton.snp.right).offset(32)
        }
    }
    
    @objc private func backButtonTapped() {
        // Dismiss the view controller when back button is tapped
        dismiss(animated: true, completion: nil)
    }
    
    func startTimer() {
          // Schedule a timer to fire every second
          timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
      }
      
      @objc func updateTime() {
          secondsElapsed += 1
          
          // Calculate minutes and seconds
          let minutes = secondsElapsed / 60
          let seconds = secondsElapsed % 60
          
          // Update the label
          timeLabel.text = String(format: "%d:%02d", minutes, seconds)
      }
      
      deinit {
          // Invalidate the timer when the view controller is deallocated
          timer?.invalidate()
      }
}


extension CallAIViewController: RoomDelegate {

    func room(_: Room, participant _: LocalParticipant, didPublishTrack publication: LocalTrackPublication) {
        guard let track = publication.track as? VideoTrack else { return }
        DispatchQueue.main.async {
            self.localVideoView.track = track
        }
    }

    func room(_: Room, participant _: RemoteParticipant, didSubscribeTrack publication: RemoteTrackPublication) {
        guard let track = publication.track as? VideoTrack else { return }
        DispatchQueue.main.async {
            self.remoteVideoView.track = track
        }
    }
}

extension CallAIViewController {
    func makeRoom() {
        self.showLoadingView()
        NetworkManager.shared.makeRoom { roomId in
            self.dissmissLoadingView()
            if let id = roomId {
                UD.room_ID = id
                self.getToken(roodId: id)
                print("Received room ID: \(id)")
            } else {
                print("Failed to get room ID")
            }
        }
    }
    
    func getToken(roodId: String) {
        let identityName = "Jonibek_Yo'ldoshov"
        let name = "Jonibek Yo'ldoshov"

        NetworkManager.shared.getToken(identityName: identityName, roomId: roodId, name: name) { token in
            if let token = token {
                UD.voiceAI_ID = token
                print("Received Token: \(token)")
                self.connectToLiveKit(token: token)
                self.startTimer()
            } else {
                print("Failed to get token")
            }
        }
    }
}
