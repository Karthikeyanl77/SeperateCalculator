//
//  RootViewController.swift
//  SeperateCalculator
//
//  Created by Karthikeyan.L on 07/08/24.
//

import UIKit

class RootViewController: UIViewController {
    
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var floatbutton: UIButton!
    //var firstInput: String? = nil
    var firstInput: String = ""
    var secondInput: String = ""
    var result: Any = 0
    var operation: String = ""
    var Validate: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputLabel.text = "0"
        
    }
    
    func updateDisplay(with input: String) {
         print("2")
        if inputLabel.text == "0" {
            inputLabel.text = input
           print("first")
        } else
        {
            inputLabel.text?.append(input)
           print("second")
        }
        
    }
    
    
    func newvaluechecking(finishTask: Bool) {
        if finishTask == true {
            
        }
    }
    
    
    // calculate button Pressed ÷,x,-,+,=,%
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        if let calculateButton = sender.titleLabel?.text {
            
            if calculateButton == "+" {
                print("4")
                
                operation = calculateButton
                
                if firstInput != "" && secondInput != ""   {
                  print("5")
                    result = Double(firstInput)! + Double(secondInput)!
                   inputLabel.text = String(format: "%.0f", result as! CVarArg)
                   firstInput = String(format: "%.0f", result as! CVarArg)
                   secondInput = ""
                    
                }else
                {
                    firstInput = inputLabel.text!
                }
               
                
            }else if calculateButton == "-" {
                
                operation = calculateButton
                
                if firstInput != ""  && secondInput != "" {
                    result = Double(firstInput)! - Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    
                }else
                {
                    firstInput = inputLabel.text!
                }
                
            } else if calculateButton == "x" {
                
                operation = calculateButton
                
                if firstInput != "" && secondInput != "" {
                    result = Double(firstInput)! * Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    
                }else
                {
                    firstInput = inputLabel.text!
                }
                
            } else if calculateButton == "÷" {
                
                operation = calculateButton
                
                if firstInput != "" && secondInput != "" {
                    result = Double(firstInput)! / Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    
                }else
                {
                    firstInput = inputLabel.text!
                }
                
            } else if calculateButton == "%" {
                operation = calculateButton
                
                if firstInput != "" && secondInput != "" {
                    guard secondInput != "0" else { return inputLabel.text = "Error"}
                    result = Int(firstInput)! % Int(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                } else
                {
                    firstInput = inputLabel.text!
                }
                
            }
            
            if calculateButton == "=" && firstInput != "" && secondInput != "" {
                
                switch operation {
                case "+":
                    inputLabel.text = ""
                    result = 0
                    result = Double(firstInput)! + Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    print("case +")
                case "-":
                    inputLabel.text = ""
                    result = 0
                    result = Double(firstInput)! - Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    print("case -")
                case "x":
                    inputLabel.text = ""
                    result = 0
                    result = Double(firstInput)! * Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    print("case x")
                case "÷":
                    inputLabel.text = ""
                    result = 0
                    guard secondInput != "0" else {  return inputLabel.text = "Error" }
                    result = Double(firstInput)! / Double(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    print("case /")
                case "%":
                    inputLabel.text = ""
                    result = 0
                    guard secondInput != "0" else { return inputLabel.text = "Error" }
                    result = Int(firstInput)! % Int(secondInput)!
                    inputLabel.text = String(format: "%.0f", result as! CVarArg)
                    firstInput = String(format: "%.0f", result as! CVarArg)
                    secondInput = ""
                    print("case +")
                default:
                    inputLabel.text = "Error"
                }
                
            }
            
        }
    }
    
    // Number Button Pressed 7,8,9,4,5,6,1,2,3,0,.
    @IBAction func numberPressed(_ sender: UIButton) {
        
        guard let input = sender.titleLabel?.text else { return }
        
            if firstInput != "" && secondInput == "" {
                print("1")
                inputLabel.text = ""
            }
            
            updateDisplay(with: input)
            
            if firstInput != ""  {
                print("3")
                secondInput = inputLabel.text ?? "";
            }
        
    }
    
    // Button Pressed  AC
    @IBAction func buttonACPressed(_ sender: UIButton) {
        
        if (sender.titleLabel?.text) != nil {
            //print("The User Pressed Button is: \(ACButton!)")
            inputLabel.text = "0"
            firstInput = ""
            secondInput = ""
            result = 0
        }
    }
    
    
    // Button Pressed +/-
    @IBAction func plusminusButtonPressed(_ sender: UIButton) {
        
        guard let number = inputLabel.text , let currentvalue = Int(number) else { return }
        
        let newVal = -currentvalue
        inputLabel.text = String(newVal)
        
      //  print("The User Pressed Button is: \(PlusMinus!)")
    }
    
    
    
    
    
    
}
