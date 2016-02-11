//
//  ScientificViewController.swift
//  FinalCalculator
//
//  Created by Malhotra,Prankur on 2/10/16.
//  Copyright © 2016 Malhotra,Prankur. All rights reserved.
//

import UIKit

class ScientificViewController: UIViewController {
    
    
    var baseController : ViewController!
    var regularCalc : RegularCalc!
    var isTypingNumber = false
    var firstNumber = 1.0
    var secondNumber = 1.0
    var answer = 0.0
    var operation:String = ""
    var calculatorDisplay: UILabel!
    
    
    @IBAction func clear(sender: AnyObject) {
        
        regularCalc.clear(sender)
    }
    
    @IBAction func operationTapped(sender: AnyObject) {
        
        if baseController.label.text!.characters.count > 0 {
            
            if let val = Double(baseController.label.text!) {
                regularCalc.secondNumber  = val
            }
            
        }
        
        // baseController.label?.text = sender.currentTitle!
        baseController.operation =  sender.currentTitle!!
        baseController.scilabel.text =  baseController.operation
        regularCalc.operationTapped=true
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate=UIApplication.sharedApplication().delegate as! AppDelegate
        
        baseController = appDelegate.getBaseViewController()
        
        regularCalc = appDelegate.getRegularViewController()
        baseController.type = .SCI
    }
    
}
