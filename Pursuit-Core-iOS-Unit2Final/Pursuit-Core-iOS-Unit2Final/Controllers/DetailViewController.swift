//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Brendon Cecilio on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var detailColors: Crayon!
    
    var redColor: Float = 0 {
        didSet{
            redLabel.text = "\(redSlider.value)"
        }
    }
    
    var greenColor: Float = 0 {
        didSet{
            greenLabel.text = "\(greenSlider.value)"
        }
    }
    
    var blueColor: Float = 0 {
        didSet{
            blueLabel.text = "\(blueSlider.value)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat(detailColors.red/255), green: CGFloat(detailColors.green/255), blue: CGFloat(detailColors.blue/255), alpha: 1.0)
        redSlider.value = Float(detailColors.red/255)
        greenSlider.value = Float(detailColors.green/255)
        blueSlider.value = Float(detailColors.blue/255)
        redLabel.text = Float(CGFloat(redSlider.value)).description
        greenLabel.text = Float(CGFloat(greenSlider.value)).description
        blueLabel.text = Float(CGFloat(blueSlider.value)).description
        configureSlider()
        configureStepper()
    }
    
    func configureSlider() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = Float(detailColors.red/255)
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = Float(detailColors.green/255)
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = Float(detailColors.blue/255)
    }
    
    func configureStepper() {
        alphaStepper.minimumValue = 0
        alphaStepper.maximumValue = 1.0
        alphaStepper.value = 1.0
        alphaStepper.stepValue = 0.1
        redSlider.value = Float(detailColors.red/255)
        greenSlider.value = Float(detailColors.green/255)
        blueSlider.value = Float(detailColors.blue/255)
    }
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        alphaLabel.text = Float(CGFloat(sender.value)).description
        let backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(sender.value))
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redLabel.text = Float(CGFloat(sender.value)).description
        let backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(sender.value))
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenLabel.text = Float(CGFloat(sender.value)).description
        let backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(sender.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(sender.value))
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueLabel.text = Float(CGFloat(sender.value)).description
        let backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(sender.value), alpha: CGFloat(sender.value))
        view.backgroundColor = backgroundColor
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        view.backgroundColor = UIColor(red: CGFloat(detailColors.red/255), green: CGFloat(detailColors.green/255), blue: CGFloat(detailColors.blue/255), alpha: 1.0)
        redSlider.value = Float(detailColors.red/255)
        greenSlider.value = Float(detailColors.green/255)
        blueSlider.value = Float(detailColors.blue/255)
        redLabel.text = Float(CGFloat(redSlider.value)).description
        greenLabel.text = Float(CGFloat(greenSlider.value)).description
        blueLabel.text = Float(CGFloat(blueSlider.value)).description
    }
    
}
