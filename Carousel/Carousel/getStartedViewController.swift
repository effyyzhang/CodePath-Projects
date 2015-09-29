//
//  getStartedViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/28/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class getStartedViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onCloseButtonClicked(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onButton3Clicked(sender: UIButton) {
        sender . selected = true
    }
    @IBAction func onButton2Clicked(sender: UIButton) {
        sender . selected = true
    }
    @IBAction func onButton1Clicked(sender: UIButton) {
        sender . selected = true
    }
}
