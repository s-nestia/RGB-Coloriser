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
        redColorParameter.text = "0.00"
        greenColorParameter.text = "0.00"
        blueColorParameter.text = "0.00"
    }

    @IBAction private func redColorChange(_ sender: UISlider) {
        redColorParameter.text = String(format: "%.2f", redColorSlider.value)
    }
    
    @IBAction private func greenColorChange(_ sender: UISlider) {
          greenColorParameter.text = String(format: "%.2f", greenColorSlider.value)
    }
    
    @IBAction private func blueColorChange(_ sender: UISlider) {
          blueColorParameter.text = String(format: "%.2f", blueColorSlider.value)
    }
    
    @IBAction private func viewColorChange(_ sender: UISlider) {
        let color = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1.0
        )
        colorView.backgroundColor = color
    }
}

