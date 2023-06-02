//
//  SettingsViewController.swift
//  SetColorView
//
//  Created by Дмитрий on 05.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    
    @IBOutlet var viewColor: UIView!
    
    var backgroundColor: UIColor!
    unowned var delegate: SettingsViewControllerDelegate!
    var oldValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 10
        viewColor.backgroundColor = backgroundColor
        setValue()
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        updateRGB()
        switch sender {
        case redSlider:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTF.text = redLabel.text
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTF.text = greenLabel.text
        default:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTF.text = blueLabel.text
            
        }
    }
    
    @IBAction func pushButton() {
        guard let newColor = viewColor.backgroundColor else {return}
        backgroundColor = newColor
        delegate.setNewColor(for: backgroundColor)
        dismiss(animated: true)
    }
    
    private func updateRGB() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
    private func setValue() {
        setSliders()
        setLabel()
        setTextFild()
    }
    
    private func setLabel() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setTextFild() {
        redTF.text = redLabel.text
        greenTF.text = greenLabel.text
        blueTF.text = blueLabel.text
    }
    
    private func setSliders() {
        if let components = viewColor.backgroundColor?.cgColor.components {
            if components.count >= 3 {
                redSlider.value = Float(components[0])
                greenSlider.value = Float(components[1])
                blueSlider.value = Float(components[2])
            } else {
                return
            }
        }
    }
    
    private func showAlert(addMessage message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        oldValue = textField.text ?? "0.0"
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [flexibleSpace, doneButton]
        textField.inputAccessoryView = toolbar
        
        return true
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else {
            showAlert(addMessage: "Please, enter correct value")
            textField.text = oldValue
            return
        }
        guard numberValue > 0.0 && numberValue <= 1.0 else {
                showAlert(addMessage: "Please, enter a value between 0.0 and 1.0")
                textField.text = oldValue
                return
        }
        switch textField {
        case redTF:
            redSlider.value = numberValue
            updateRGB()
        case greenTF:
            greenSlider.value = numberValue
            updateRGB()
        case blueTF:
            blueSlider.value = numberValue
            updateRGB()
        default:
            return
        }
    }
}


