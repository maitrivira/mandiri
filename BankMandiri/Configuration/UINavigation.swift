//
//  UINavigation.swift
//  BankMandiri
//
//  Created by Maitri Vira on 11/10/23.
//

import UIKit

extension UINavigationController {
    func setNavbarColor() {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        
        apperance.backgroundColor = .red
        apperance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        apperance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationBar.standardAppearance = apperance
        self.navigationBar.scrollEdgeAppearance = apperance
        self.navigationBar.compactAppearance = apperance
        
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
    }
}
