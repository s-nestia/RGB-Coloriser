//
//  SettingsViewController.swift
//  RGB Coloriser
//
//  Created by Anastasia Liapich on 6/24/22.
//  Copyright © 2022 Anastasia Liapich. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet private var colorView: UIView!
    
    @IBOutlet private var redColorSlider: UISlider!
    @IBOutlet private var greenColorSlider: UISlider!
    @IBOutlet private var blueColorSlider: UISlider!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    @IBOutlet private var redColorParameter: UILabel!
    @IBOutlet private var greenColorParameter: UILabel!
    @IBOutlet private var blueColorParameter: UILabel!
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = delegate?.currentColor
        navigationItem.hidesBackButton = true
        setSliderValues()
        redColorTextField.delegate = self
        greenColorTextField.delegate = self
        blueColorTextField.delegate = self
    }
    
    @IBAction func doneAction() {
        view.endEditing(true)
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction private func viewColorChange(_ sender: UISlider) {
        setColor()
        switch sender {
        case redColorSlider:
            redColorParameter.text = string(from: redColorSlider)
            redColorTextField.text = string(from: redColorSlider)
        case greenColorSlider:
            greenColorParameter.text = string(from: greenColorSlider)
            greenColorTextField.text = string(from: greenColorSlider)
        default:
            blueColorParameter.text = string(from: blueColorSlider)
            blueColorTextField.text = string(from: blueColorSlider)
        }
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0
        )
    }
    
    private func setSliderValues() {
        guard let color = colorView.backgroundColor else {
            return
        }
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: nil)

        redColorSlider.value = Float(red)
        greenColorSlider.value = Float(green)
        blueColorSlider.value = Float(blue)
        
        setTextValue(for: redColorTextField, greenColorTextField, blueColorTextField)
        setValue(for: redColorParameter, greenColorParameter, blueColorParameter)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorParameter:
                redColorParameter.text = string(from: redColorSlider)
            case greenColorParameter:
                greenColorParameter.text = string(from: greenColorSlider)
            default:
                blueColorParameter.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func setTextValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redColorTextField:
                redColorTextField.text = string(from: redColorSlider)
            case greenColorTextField:
                greenColorTextField.text = string(from: greenColorSlider)
            default:
                blueColorTextField.text = string(from: blueColorSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redColorTextField:
            redColorSlider.value =  Float(textField.text ?? "") ?? 0
            viewColorChange(redColorSlider)
        case greenColorTextField:
            greenColorSlider.value =  Float(textField.text ?? "") ?? 0
            viewColorChange(greenColorSlider)
        default:
            blueColorSlider.value =  Float(textField.text ?? "") ?? 0
            viewColorChange(blueColorSlider)
        }
    }
}

