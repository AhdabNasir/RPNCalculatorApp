//
//  ViewController.swift
//  CalculatorRPN
//
//  Created by Ahdab Nasir on 18/02/2016.
//  Copyright © 2016 Ahdab Nasir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var calcDisplay: UILabel!
    
    @IBOutlet weak var tan: UIButton!
    @IBOutlet weak var cos: UIButton!
    @IBOutlet weak var dec: UIButton!
    @IBOutlet weak var sin: UIButton!
    @IBOutlet weak var second: UIButton!
    
    var calcEngine :CalculatorEngine?
    var butname : String?
    var labelString : String = ""
    var calcTape = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        butname = "deg"
        
        if self.calcEngine == nil {
            self.calcEngine = CalculatorEngine()
        }
        
    }
    
    var userHasStartedTyping = false
    
    @IBAction func digitPressed(sender: UIButton) {
        
        let digit = sender.currentTitle!
        //let because it will not change
        
        print("digit pressed = \(digit)")
        
        if userHasStartedTyping {
            labelDisplay.text = labelDisplay.text! + "\(digit)"
          
        }
        else {
            labelDisplay.text = digit
            userHasStartedTyping = true
        }
    }
    
    var displayValue : Double {
        
        get {
            return (NSNumberFormatter().numberFromString(labelDisplay.text!)?.doubleValue)!
        }
        
        set(newValue) {
            labelDisplay.text = "\(newValue)"
        }
    }
    
    
    @IBAction func enter() {
        
        userHasStartedTyping = false
        self.calcEngine!.operandStack.append(displayValue)
        dec.enabled = true
        calcDisplay.text! += "\(displayValue)↵"
        
        labelString = labelString + "\(displayValue)↵"
        
        print ("Operand Stack on engine = \(self.calcEngine!.operandStack)")
        
    }
    
    
    @IBAction func operation(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if userHasStartedTyping {
            enter()
        }
        
        self.displayValue = (self.calcEngine?.operate(operation,buttonname: butname!))!
        
        labelString += "\(operation)"
        
        calcDisplay.text! += "\(operation)"
        
        enter()
        
        calcTape.append(labelString)
        
        labelString = ""
        
        
        
    }
    
    @IBAction func allClear(sender: UIButton) {
        
            labelDisplay.text = "\(0)"
            calcDisplay.text = ""
            self.calcEngine!.operandStack.removeAll()
            userHasStartedTyping = false
        }
    
    @IBAction func clear(sender: UIButton) {
        
//            labelDisplay.text = (self.labelDisplay.text! as NSString).substringToIndex(self.labelDisplay.text!.characters.count - 1)
//            
//            if  labelDisplay.text!.isEmpty {
//                labelDisplay.text = "\(0)"
//                userHasStartedTyping = false
//           }
        
        labelDisplay.text = "\(0)"
        self.calcEngine!.operandStack.removeLast()
        userHasStartedTyping = false
        }
    
    
    @IBAction func decimal(sender: UIButton) {
        
        let decimal = sender.currentTitle!
        
        if userHasStartedTyping{
            labelDisplay.text = labelDisplay.text! + "\(decimal)"
            calcDisplay.text = calcDisplay.text! + "\(decimal)"
            dec.enabled = false
        }
        else{
            labelDisplay.text = ("0")
            userHasStartedTyping = true
            dec.enabled = true
        }
    }
    
    
    @IBAction func degRad(sender: UIButton) {
        
        if(sender.titleLabel!.text == "deg") {
            
            sender.setTitle("rad", forState: UIControlState.Normal)
            butname = "rad"
        }
        else {
            sender.setTitle("deg", forState: UIControlState.Normal)
            
            butname = "deg"
        }
    }
    
    
    @IBAction func second(sender: UIButton) {
        
        if(sin.titleLabel!.text == "sin") {
            sin.setTitle("sin-¹", forState: UIControlState.Normal)
        }
        else {
            sin.setTitle("sin", forState: UIControlState.Normal)
        }
        
        if(cos.titleLabel!.text == "cos") {
            cos.setTitle("cos-¹", forState: UIControlState.Normal)
        }
        else {
            cos.setTitle("cos", forState: UIControlState.Normal)
        }
        
        if(tan.titleLabel!.text == "tan") {
            tan.setTitle("tan-¹", forState: UIControlState.Normal)
        }
        else {
            tan.setTitle("tan", forState: UIControlState.Normal)
        }
        
        if(second.titleLabel!.text == "2nd") {
            second.setTitle("1st", forState: UIControlState.Normal)
        }
        else {
            second.setTitle("2nd", forState: UIControlState.Normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let calcVC: CalcViewController = segue.destinationViewController as! CalcViewController
        
        calcVC.getTape = calcTape
        
        print(calcTape)
    }


}

