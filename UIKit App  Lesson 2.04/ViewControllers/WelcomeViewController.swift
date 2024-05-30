//
//  WelcomeViewController.swift
//  UIKit App  Lesson 2.04
//
//  Created by Max on 27.05.2024.
//

import UIKit

protocol SetColorViewControllerDelegate: AnyObject {
    func applyColor(with color: UIColor)
}

final class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setColorVC = segue.destination as? SetColorViewController else { return }
        setColorVC.currentViewColor = view.backgroundColor
        setColorVC.delegate = self
    }
}

extension WelcomeViewController: SetColorViewControllerDelegate {
    func applyColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
