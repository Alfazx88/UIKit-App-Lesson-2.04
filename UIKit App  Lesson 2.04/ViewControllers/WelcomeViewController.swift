//
//  WelcomeViewController.swift
//  UIKit App  Lesson 2.04
//
//  Created by Max on 27.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController, SetColorViewControllerDelegate {
    
    // private var currentViewColor: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        // currentViewColor = view.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setColorVC = segue.destination as? SetColorViewController else { return }
        setColorVC.currentViewColor = view.backgroundColor
        setColorVC.delegate = self
    }
    
    func applyColor(with chosenColor: UIColor) {
        view.backgroundColor = chosenColor
    }
    
}
