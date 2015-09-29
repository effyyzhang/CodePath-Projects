//
//  Signin1ViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/24/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class Signin1ViewController: UIViewController{
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var creatTextImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var filedForm1Image: UIImageView!
    @IBOutlet weak var filedForm2Image: UIImageView!
    @IBOutlet weak var signinButtonImage: UIImageView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var initialY1:CGFloat!
    let offset1: CGFloat = -67
    
    var initialY2:CGFloat!
    let offset2: CGFloat = -253

    
    override func viewWillAppear(animated: Bool) {

        self.topView.alpha = 0
        topView.transform = CGAffineTransformMakeScale(0.5, 0.5)

    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, animations: {

            self.topView.alpha = 1
            self.topView.transform = CGAffineTransformMakeScale(1, 1)
            
        })

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY1 = topView.frame.origin.y
        initialY2 = bottomView.frame.origin.y
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
       //
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onBackButtonClicked(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func onTap(sender: AnyObject) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
    }

    
    @IBAction func onSignInClicked(sender: AnyObject) {
        if emailTextField.text == "" && passwordTextField.text == "" {
            let altercontroller = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .Alert)
            altercontroller .addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(altercontroller, animated:true, completion:nil)
        }
        else if emailTextField.text == "effy@squareup.com" && passwordTextField.text == "password" {
            let altercontroller = UIAlertController(title: "Signing in...", message: "", preferredStyle: .Alert)
            self.presentViewController(altercontroller, animated:true, completion:nil)
            delay(2) {
                self.performSegueWithIdentifier("Segue1", sender: nil)
                altercontroller.dismissViewControllerAnimated(true, completion: nil)
                }
        }else{
            let altercontroller = UIAlertController(title: "Signing In...", message: "", preferredStyle: .Alert)
            self.presentViewController(altercontroller, animated:true, completion:nil)
            delay(2){
                altercontroller.title = "Sign in failed"
                altercontroller.message = "Incorrect email address or password"
                altercontroller .addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            }
            
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
            self.topView.frame.origin = CGPoint(x: self.topView.frame.origin.x, y: self.initialY1 + self.offset1)
            
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
            
            self.topView.frame.origin = CGPoint(x: self.topView.frame.origin.x, y: self.initialY1)
            
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

}

