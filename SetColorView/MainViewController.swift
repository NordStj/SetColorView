//
//  MainViewController.swift
//  SetColorView
//
//  Created by Дмитрий on 30.05.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewColor(for backgroungColor: UIColor )
}

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.backgroundColor = self.view.backgroundColor
            settingsVC.delegate = self
        }
        
    }
}
extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(for backgroungColor: UIColor) {
        view.backgroundColor = backgroungColor
    }
}
