//
//  ViewController.swift
//  SetColorView
//
//  Created by Дмитрий on 05.05.2023.
//

import UIKit

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
        // Do any additional setup after loading the view.
    }

    @IBAction func redSliderAction() {
        redLabel.text = String(format: "red: %.2f", redSlider.value)
        updateRGB()
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "blue: %.2f", blueSlider.value)
        updateRGB()
    }
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "green: %.2f", greenSlider.value)
        updateRGB()
    }
    func updateRGB() {
        let updateColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0)
        viewColor.backgroundColor = updateColor
        viewColor.setNeedsDisplay()
    }
}


