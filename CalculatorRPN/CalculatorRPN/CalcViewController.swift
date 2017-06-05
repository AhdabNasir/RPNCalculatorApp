//
//  CalcViewController.swift
//  CalculatorRPN
//
//  Created by Ahdab Nasir on 25/02/2016.
//  Copyright © 2016 Ahdab Nasir. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var calcTape: UITextView!
    
    var getTape = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for line in getTape {
            calcTape.text = calcTape.text + line + "\r\n"
        }
        
        self.navigationController?.navigationBarHidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
