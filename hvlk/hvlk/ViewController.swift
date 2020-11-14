//
//  ViewController.swift
//  hvlk
//
//  Created by MacBook Air on 13.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        segment.insertSegment(withTitle: "Last", at: 2, animated: true)
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.red, for: .normal)
        textView.font = UIFont(name: "American Typewriter", size: 30)
        stepper.value = 30
        stepper.minimumValue = 1
        stepper.maximumValue = 111
        
    }
    
    @IBAction func segmentAcion(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            label.text = "Mercedes"
            label.backgroundColor = .black
            label.textColor = .green
            label.isHidden = false
        case 1:
            label.text = "BMW"
            label.backgroundColor = .black
            label.textColor = .green
            label.isHidden = false
        case 2:
            label.text = "Audi"
            label.backgroundColor = .black
            label.textColor = .green
            label.isHidden = false
        default:
            print("Error")
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            segment.isHidden = true
            slider.isHidden = true
            textField.isHidden = true
            button.isHidden = true
            label.isHidden = true
            textView.isHidden = true
            stepper.isHidden = true
            
            switchLabel.text = "NO"
            switchLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            switchLabel.textColor = .white
            
        } else {
            segment.isHidden = false
            slider.isHidden = false
            textField.isHidden = false
            button.isHidden = false
            label.isHidden = true
            textView.isHidden = false
            stepper.isHidden = false
            
            switchLabel.text = "YES"
            switchLabel.backgroundColor = #colorLiteral(red: 0.6857056433, green: 0.1439957933, blue: 0.7981905764, alpha: 1)
            switchLabel.textColor = .black
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        slider.minimumValue = 1
        slider.maximumValue = 111
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .black
        slider.thumbTintColor = .yellow
        label.text = String(slider.value)
        
        label.backgroundColor = .yellow
        label.textColor = .black
        
        label.isHidden = false
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        label.text = textField.text
        label.backgroundColor = .black
        label.textColor = .red
        
        label.isHidden = false
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontName = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontName)
    }
}

