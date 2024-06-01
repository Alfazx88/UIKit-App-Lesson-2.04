//
//  ViewController.swift
//  UIKit App  Lesson 2.04
//
//  Created by Giovanni on 13.04.2024.
//

import UIKit

final class SetColorViewController: UIViewController {
    
    var delegate: SetColorViewControllerDelegate?
    var currentViewColor: UIColor?
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redNumberLabel: UILabel!
    @IBOutlet var greenNumberLabel: UILabel!
    @IBOutlet var blueNumberLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        setGivenValuesForSliders(from: currentViewColor ?? UIColor.white)
        setGivenColorToView()
        [redSlider, greenSlider, blueSlider].forEach { slider in
            SliderAction(slider)
        }
    }
    
    @IBAction func SliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redNumberLabel.text = String(format: "%.2f", redSlider.value)
            redColorTF.text = redNumberLabel.text
        case greenSlider:
            greenNumberLabel.text = String(format: "%.2f", greenSlider.value)
            greenColorTF.text = greenNumberLabel.text
        default:
            blueNumberLabel.text = String(format: "%.2f", blueSlider.value)
            blueColorTF.text = blueNumberLabel.text
        }
        setGivenColorToView()
    }
    
    @IBAction func doneButton() {
        guard let chosenColor = colorView.backgroundColor else { return }
        delegate?.applyColor(with: chosenColor)
        dismiss(animated: true)
    }
    
    private func setGivenColorToView() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
}

// MARK: - Private Methods
extension SetColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard Float(textField.text!) ?? -1 <= 1.0,
              Float(textField.text!) ?? -1 >= 0.0 else {
            showAlert(
                title: "Invalid input",
                message: "Enter value from 0.0 to 1.0",
                textField: textField)
            return
        }
        switch textField {
        case redColorTF:
            redSlider.value = Float(textField.text ?? "") ?? 0.0
            SliderAction(redSlider)
        case greenColorTF:
            greenSlider.value = Float(textField.text ?? "") ?? 0.0
            SliderAction(greenSlider)
        default:
            blueSlider.value = Float(textField.text ?? "") ?? 0.0
            SliderAction(blueSlider)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

private extension SetColorViewController {
    func setGivenValuesForSliders(from color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    func showAlert(title: String, message: String, textField: UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in 
            textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

private extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
