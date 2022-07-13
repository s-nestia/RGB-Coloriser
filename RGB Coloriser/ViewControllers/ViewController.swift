//
//  ViewController.swift
//  RGB Coloriser
//
//  Created by Anastasia Liapich on 6/24/22.
//  Copyright © 2022 Anastasia Liapich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var colorView: UIView!
    
    @IBOutlet private var redColorSlider: UISlider!
    @IBOutlet private var greenColorSlider: UISlider!
    @IBOutlet private var blueColorSlider: UISlider!
    
    @IBOutlet private var redColorParameter: UILabel!
    @IBOutlet private var greenColorParameter: UILabel!
    @IBOutlet private var blueColorParameter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        setColor()
        setValue(for: redColorParameter, greenColorParameter, blueColorParameter)
    }
    
    @IBAction private func viewColorChange(_ sender: UISlider) {
        setColor()
        switch sender {
            case redColorSlider:
                redColorParameter.text = string(from: redColorSlider)
            case greenColorSlider:
                greenColorParameter.text = string(from: greenColorSlider)
            default:
                blueColorParameter.text = string(from: blueColorSlider)
        }
        setValue(for: redColorParameter, greenColorParameter, blueColorParameter)
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0
        )
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
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}

