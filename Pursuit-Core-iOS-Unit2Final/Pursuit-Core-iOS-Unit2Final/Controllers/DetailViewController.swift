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
        configureSlider()
        configureStepper()
        redColor = Float(detailColors.red)
        greenColor = Float(detailColors.green)
        blueColor = Float(detailColors.blue)
    }
    
    func configureSlider() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.value = Float(detailColors.red)
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.value = Float(detailColors.green)
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.value = Float(detailColors.blue)
    }
    
    func configureStepper() {
        alphaStepper.minimumValue = 0
        alphaStepper.maximumValue = 1.0
        alphaStepper.value = 1.0
        alphaStepper.stepValue = 0.1
    }
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        redSlider.value = Float(CGFloat(sender.value))
        greenSlider.value = Float(CGFloat(sender.value))
        blueSlider.value = Float(CGFloat(sender.value))
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
    }
    
}
