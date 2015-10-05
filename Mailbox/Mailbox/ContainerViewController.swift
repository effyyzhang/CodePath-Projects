//
//  ContainerViewController.swift
//  Mailbox
//
//  Created by Effy Zhang on 10/3/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
	@IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
	@IBOutlet weak var archiveView: UIView!
	@IBOutlet weak var laterView: UIView!
	@IBOutlet weak var messageView: UIImageView!
	
	var messageOriginalCenter: CGPoint!
	var archiveOriginalCenter: CGPoint!
	var laterOriginalCenter: CGPoint!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		archiveView.alpha = 1
		laterView.alpha  = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func onPan(sender: UIPanGestureRecognizer) {
		//var point = panGestureRecognizer.locationInView(view)
		let translation = panGestureRecognizer.translationInView(view)
		let velocity = panGestureRecognizer.velocityInView(view)
		
		
		if  panGestureRecognizer.state == UIGestureRecognizerState.Began {
			messageOriginalCenter = messageView.center
			archiveOriginalCenter = archiveView.center
			laterOriginalCenter = laterView.center
            
        } else if  panGestureRecognizer.state == UIGestureRecognizerState.Changed {
			
			messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x , y: messageOriginalCenter.y)
			
			if velocity.x < 0 && translation.x < -65 {
				
				laterView.center = CGPoint(x: laterOriginalCenter.x + translation.x, y: laterOriginalCenter.y)
			} else if velocity.x >= 0 && translation.x >= 65 {
				
				archiveView.center = CGPoint(x: archiveOriginalCenter.x + translation.x , y: archiveOriginalCenter.y)
				
			}else{
				
				archiveView.center = CGPoint(x: archiveOriginalCenter.x, y: archiveOriginalCenter.y)
				laterView.center = CGPoint(x: laterOriginalCenter.x, y: laterOriginalCenter.y)
				
				
				
			}

            
        } else if  panGestureRecognizer.state == UIGestureRecognizerState.Ended {
			
			if velocity.x < 0 && translation.x < -65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x - 320, y: self.messageOriginalCenter.y)
				})
				
			} else if velocity.x < 0 && translation.x > -65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x , y: self.messageOriginalCenter.y)
				})
				
			} else if velocity.x >= 0 && translation.x >= 65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x + 320, y: self.messageOriginalCenter.y)
				})
				
			} else if velocity.x >= 0 && translation.x < 65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
				})
				
			} else {
				
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
				})
				
			}

            
        }
	}

}
