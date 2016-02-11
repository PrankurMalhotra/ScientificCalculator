//
//  RegularCalc.swift
//  FinalCalculator
//
//  Created by Malhotra,Prankur on 2/10/16.
//  Copyright © 2016 Malhotra,Prankur. All rights reserved.
//

import UIKit

class RegularCalc: UIViewController {
    var isTypingNumber = false
    var firstNumber = 1.0
    var secondNumber = 1.0
    var answer:Float = 0.0
    
    var baseController:ViewController!
    var calculatorDisplay: UILabel!
    var appDelegate:AppDelegate!
    var operationTapped:Bool=false
    
    
    
    @IBAction func numberClick(sender: AnyObject) {
        var input:String = ""
        if (operationTapped) {
            
            
            
            
            
            if let  baseInp = baseController.label.text{
                input = baseInp
            }else{
                input = ""
            }
            
            baseController.label.text = (input + sender.currentTitle!!)
            secondNumber = Double(baseController.label.text!)!
            
            
        }else{
            input = baseController.label.text!
        }
        
        
        let number = sender.currentTitle!
        baseController.label.text = (input + number!)
        
        
        
    }
    @IBAction func operationTapped(sender: AnyObject) {
        firstNumber = Double(baseController.label.text!)!
        //baseController.label.text = nil
        baseController.operation =  sender.currentTitle!!
        isTypingNumber=false
        operationTapped=true
        baseController.label.text = nil
        
    }
    
    @IBAction func decimalTapped(sender: AnyObject) {
        let temp:String = baseController.label.text! + "."
        baseController.label.text = temp
        
    }
    @IBAction func equalsTapped(sender: AnyObject) {
        
        operationTapped = false
        
        switch baseController.operation {
            
        case "+":
            answer = Float(firstNumber + secondNumber)
            
            
        case "-":
            answer = Float(firstNumber - secondNumber)
            
            
        case "*":
            answer = Float(firstNumber * secondNumber)
            
        case "/":
            answer = Float(firstNumber / secondNumber)
            
        case "Sin":
            
            answer = Float(firstNumber * sin(secondNumber))
            
        case "Cos":
            answer = Float(firstNumber * cos(secondNumber))
            
        case "Tan":
            answer = Float(firstNumber * tan(secondNumber))
            
        case "Log":
            answer = Float(firstNumber * log(secondNumber))
        case "X^2":
            answer = Float(pow(secondNumber, 2))
            
        case "Pi":
            answer = Float(M_PI)
            
        case "SQRT":
            answer = Float(sqrt(secondNumber))
        default:
            print("invalid operation")
        }
        print(baseController.scilabel.text!)
        
        if let _ = Double(baseController.scilabel.text!) {
            
        }else if (baseController.scilabel.text?.characters.count>0) {
            
            baseController.scilabel.text = baseController.scilabel.text! + " (\(baseController.label.text!))"
  
        }
        
        
        baseController.label.text = answer.description
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        baseController.label.text = ""
        isTypingNumber=false
        firstNumber=0.0
        secondNumber=0.0
        operationTapped=false
        baseController.operation  = ""
        baseController.scilabel.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let appDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        
        baseController = appDelegate.getBaseViewController()
        baseController.type  = .REG
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
