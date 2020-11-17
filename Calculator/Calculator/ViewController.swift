//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook Air on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var doteIsPlaced = false
    var firsOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        }  else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firsOperand = currentInput
        stillTyping = false
        doteIsPlaced = false
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firsOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        if stillTyping { 
            secondOperand = currentInput
        }
        
        doteIsPlaced = false
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "×":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
            
        default:
            break
        }
    }
    
    
    @IBAction func clearButtonPresed(_ sender: UIButton) {
        firsOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        doteIsPlaced = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPresed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    
    @IBAction func percentageButtonPresed(_ sender: UIButton) {
        if firsOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firsOperand * currentInput / 100
        }
    }
    
    @IBAction func squareButtonPresed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func doteButtonPresed(_ sender: UIButton) {
        if stillTyping && !doteIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            doteIsPlaced = true
        } else if !stillTyping && !doteIsPlaced {
            displayResultLabel.text = "0."
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

