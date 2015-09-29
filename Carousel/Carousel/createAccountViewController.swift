//
//  createAccountViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/28/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class createAccountViewController: UIViewController {

    @IBOutlet weak var createText: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var createAccountFormView: UIView!
    @IBOutlet weak var createAccountButton: UIImageView!
    
    @IBOutlet weak var formView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var termsText: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var backButton: UIButton!
    var initialY1:CGFloat!
    let offset1: CGFloat = -87
    
    var initialY2:CGFloat!
    let offset2: CGFloat = -173
    
    override func viewWillAppear(animated: Bool) {
        self.createAccountFormView.alpha = 0
        self.createAccountFormView.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, animations: {

            self.createAccountFormView.alpha = 1
            self.createAccountFormView.transform = CGAffineTransformMakeScale(1, 1)
            
        })
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY1 = createAccountFormView.frame.origin.y
        initialY2 = bottomView.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        firstNameTextField.endEditing(true)
        lastNameTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    
    @IBAction func onSubmit(sender: AnyObject) {
        
        if firstNameTextField.text == "Effy" && lastNameTextField.text == "Zhang"{
            let altercontroller = UIAlertController(title: "Creating Account...", message: "", preferredStyle: .Alert)
            self.presentViewController(altercontroller, animated:true, completion:nil)
            delay(2) {
                self.performSegueWithIdentifier("Segue2", sender: nil)
                altercontroller.dismissViewControllerAnimated(true, completion: nil)
                }
        }else{
            let altercontroller = UIAlertController(title: "Frist Name Required", message: "Please enter your first name", preferredStyle: .Alert)
            altercontroller .addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(altercontroller, animated:true, completion:nil)
        }
    }
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            self.createAccountFormView.frame.origin = CGPoint(x: self.createAccountFormView.frame.origin.x, y: self.initialY1 + self.offset1)
            
            self.bottomView.frame.origin = CGPoint(x: self.bottomView.frame.origin.x, y: self.initialY2 + self.offset2)
            
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            self.createAccountFormView.frame.origin = CGPoint(x: self.createAccountFormView.frame.origin.x, y: self.initialY1)
            
            self.bottomView.frame.origin = CGPoint(x: self.bottomView.frame.origin.x, y: self.initialY2)
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func onBackButtonClicked(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func onButtonClicked(sender: UIButton) {
        sender.selected = true
        
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
