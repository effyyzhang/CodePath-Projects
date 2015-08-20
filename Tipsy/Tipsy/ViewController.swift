//
//  ViewController.swift
//  Tipsy
//
//  Created by Effy Zhang on 8/18/15.
//  Copyright (c) 2015 Effy Zhang. All rights reserved.
//

import UIKit


class ViewController: UIViewController, SMSegmentViewDelegate {
    
    var segmentView: SMSegmentView!
    var margin:CGFloat = 0

    @IBOutlet weak var billFiled: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billFiled.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        
        self.segmentView = SMSegmentView (frame: CGRect(x: self.margin, y: 260.0, width: self.view.frame.size.width - self.margin*2, height: 92.0), separatorColour: UIColor(white: 0.95, alpha:1), separatorWidth:0, segmentProperties: [keySegmentTitleFont: UIFont.systemFontOfSize(12.0), keySegmentOnSelectionColour: UIColor(red: 241.0/255.0, green: 99.0/255.0, blue: 79.0/255.0, alpha: 0.7), keySegmentOffSelectionColour:  UIColor(red: 255.0/255.0, green: 175.0/255.0, blue: 0.0/255.0, alpha: 1.0), keyContentVerticalMargin: Float(10.0)])
        
        self.segmentView.delegate = self
        
        // Add segments
        self.segmentView.addSegmentWithTitle("", onSelectionImage: UIImage(named: "15%-3"), offSelectionImage: UIImage(named: "15%-2"))
        self.segmentView.addSegmentWithTitle("", onSelectionImage: UIImage(named: "18%-3"), offSelectionImage: UIImage(named: "18%-2"))
        self.segmentView.addSegmentWithTitle("", onSelectionImage: UIImage(named: "20%-4"), offSelectionImage: UIImage(named: "20%-5"))
        
        // Set segment with index 0 as selected by default
        segmentView.selectSegmentAtIndex(0)
        
        self.view.addSubview(self.segmentView)
        
    }
    
    // SMSegment Delegate
    func segmentView(segmentView: SMSegmentView, didSelectSegmentAtIndex index: Int) {
        /*
        Replace the following line to implement what you want the app to do after the segment gets tapped.
        */
       println("Select segment at index: \(index)")
        self.OnEditingChanged(segmentView)
    
        
        
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    @IBAction func OnEditingChanged(sender: AnyObject) {
                var tipPercentages = [ 0.15,0.18,0.20]
                var tipPercentage = tipPercentages[segmentView.indexOfSelectedSegment]
                var billAmount = NSString(string: billFiled.text).doubleValue
                var tip = billAmount * tipPercentage
                var total = billAmount + tip
        
                tipLabel.text = "$\(tip)"
                totalLabel.text = "$\(total)"
    }

    @IBAction func clearbuttonTouchUpInside(sender: AnyObject) {
        
        billFiled.text = "$0.00"
        OnEditingChanged(sender)
    }
}

