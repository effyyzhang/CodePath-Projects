//
//  ViewController.swift
//  Tipplus
//
//  Created by Effy Zhang on 9/4/15.
//  Copyright (c) 2015 Effy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var hint1: UILabel!
    @IBOutlet weak var hint2: UILabel!
    
    @IBOutlet weak var billText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var bar1: UIView!
    @IBOutlet weak var bar2: UIView!
    @IBOutlet weak var bar3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "$"
        
        self.tipControl.alpha = 0
        self.clearButton.alpha = 0
        self.bar1.alpha = 1
        self.bar2.alpha = 1
        self.bar3.alpha = 0
        self.billText.alpha = 1
        self.billField.alpha=1
        self.tipLabel.alpha=0
        self.tipText.alpha = 0
        self.hint2.alpha = 0
        self.hint1.alpha = 0
        self.totalLabel.alpha=0
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.1, 0.15, 0.2]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string:billField.text).doubleValue
        var tip = billAmount*tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        
        
        UIView.animateWithDuration(0.4, animations:{
            self.tipControl.alpha = 1
            self.clearButton.alpha = 1
            self.bar3.alpha = 1
            self.tipLabel.alpha=1
            self.tipText.alpha = 1
            self.hint2.alpha=1
            self.totalLabel.alpha=1
            
            
            
            })

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func onClearButtonClicked(sender: AnyObject) {
        billField.text = ""
        onEditingChanged(sender)
    }
    
    
}

