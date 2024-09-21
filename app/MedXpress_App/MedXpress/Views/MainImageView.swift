//
//  file.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//

import UIKit

class MainImageView: UIImageView {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.image = image
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds = true
        contentMode = .scaleAspectFit
    }
}
