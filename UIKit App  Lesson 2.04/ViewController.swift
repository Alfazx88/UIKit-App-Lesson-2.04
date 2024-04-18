//
//  ViewController.swift
//  UIKit App  Lesson 2.04
//
//  Created by Giovanni on 13.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redNumberLabel: UILabel!
    @IBOutlet var greenNumberLabel: UILabel!
    @IBOutlet var blueNumberLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
    }
    
    @IBAction func SliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redNumberLabel.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenNumberLabel.text = String(format: "%.2f", greenSlider.value)
        default:
            blueNumberLabel.text = String(format: "%.2f", blueSlider.value)
        }
        setColor()
    }
        
        private func setColor() {
            colorView.backgroundColor = UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1)
        }
}
