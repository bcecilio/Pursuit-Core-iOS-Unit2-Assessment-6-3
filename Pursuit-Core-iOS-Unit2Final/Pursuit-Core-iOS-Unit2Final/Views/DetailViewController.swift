//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kimball Yang on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var daCrayons: Crayon!

    @IBOutlet weak var detCrayonLabel: UILabel!

    // just some labels outlets
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    // just some slider outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var AlphaStepper: UIStepper!
    @IBOutlet weak var resetValue: UIButton!
    
    //String(format: "%.02f", whateverYourvalueIS)
    
    @IBAction func daSlider(_ sender: Any) {
        updateBackgroundColor()
        redLabel.text = "Red \(String(format: "%.2f", redSlider.value))"
        greenLabel.text = "Green \(String(format: "%.2f", greenSlider.value))"
        blueLabel.text = "Blue \(String(format: "%.2f", blueSlider.value))"
        detCrayonLabel.text = "😱\(daCrayons.name)😳"
    }
    
    @IBAction func AlphaStepper(_ sender: Any) {
        updateBackgroundColor()
        if AlphaStepper.value == Double(0) {
        AlphaStepper.value = 0
        redLabel.text = "💀☠️💀☠️💀☠️"
        greenLabel.text = "💀☠️💀☠️💀☠️"
        blueLabel.text = "💀☠️💀☠️💀☠️"
        } else if AlphaStepper.value == Double(1) {
            updateLabelText()
        }
    }
    
    @IBAction func resetValue(_ sender: Any) {
        // this resets the background color
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green:
        // ((color.red)/255)
        CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
        // this resets the slider positions and stepper
        ogValues()
        // this resets the color label
        detCrayonLabel.text = daCrayons.name
        // this resets labels of sliders
        updateLabelText()
        }
    
    func ogValues() {
        redSlider.value = Float(daCrayons.red)/255
        greenSlider.value = Float(daCrayons.green)/255
        blueSlider.value = Float(daCrayons.blue)/255
        AlphaStepper.value = 1
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        }
    
     private func setUpViews() {
        // this sets up the intended view
        detCrayonLabel.text = daCrayons.name
        // this reflects the current value of colors from the segue
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
        // this reflects the current slider value of the color selected
        ogValues()
        updateLabelText()
        }
    
  
    
    func updateLabelText() {
        // this reflects the proper label of values of the sliders
        redLabel.text = "Red \(String(format: "%.2f", redSlider.value))"
        greenLabel.text = "Green \(String(format: "%.2f", greenSlider.value))"
        blueLabel.text = "Blue \(String(format: "%.2f", blueSlider.value))"
        }
    
        // updates the background color based on slider
    private func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(AlphaStepper.value))
        }
    
    }
