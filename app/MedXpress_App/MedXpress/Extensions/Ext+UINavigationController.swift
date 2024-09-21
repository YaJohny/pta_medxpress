//
//  Ext+UINavigationController.swift
//  Halol&Harom
//
//  Created by Mekhriddin Jumaev on 29/09/24.
//

import UIKit

extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }

    func backgroundColor(backgroundcolor: UIColor, tintColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundcolor
        let titleAttribute = [NSAttributedString.Key.foregroundColor: tintColor]
        appearance.titleTextAttributes = titleAttribute
        appearance.largeTitleTextAttributes = titleAttribute
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension UIViewController {
    func getBottomSafeAreaHeight() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows.first
            let topPadding = window!.safeAreaInsets.top
            let bottomPadding = window!.safeAreaInsets.bottom
            return bottomPadding
        } else {
            return 0.0
        }
    }
    
}
