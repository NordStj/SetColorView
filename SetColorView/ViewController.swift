//
//  ViewController.swift
//  SetColorView
//
//  Created by Дмитрий on 05.05.2023.
//

import UIKit

enum ColorLabel {
    case red
    case green
    case blue
}

class ViewController: UIViewController {

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var viewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 10
        setLabelValue()
    }

    @IBAction func redSliderAction() {
        setLabelValue(.red)
        updateRGB()
    }
    
    @IBAction func blueSliderAction() {
        setLabelValue(.blue)
        updateRGB()
    }
    
    @IBAction func greenSliderAction() {
        setLabelValue(.green)
        updateRGB()
    }
    
    private func updateRGB() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
    }
    
    private func setLabelValue(_ color: ColorLabel) {
        switch color {
        case .red:
            redLabel.text = String(format: "red: %.2f", redSlider.value)
        case .green:
            greenLabel.text = String(format: "green: %.2f", greenSlider.value)
        case .blue:
            blueLabel.text = String(format: "blue: %.2f", blueSlider.value)
        }
    }
    
    private func setLabelValue() {
        redLabel.text = String(format: "red: %.2f", redSlider.value)
        greenLabel.text = String(format: "green: %.2f", greenSlider.value)
        blueLabel.text = String(format: "blue: %.2f", blueSlider.value)
        
    }
}


