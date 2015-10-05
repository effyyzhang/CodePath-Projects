//
//  MainViewController.swift
//  Mailbox
//
//  Created by Effy Zhang on 10/3/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {
	@IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!
	@IBOutlet weak var firstView: UIView!
	@IBOutlet weak var messageView: UIImageView!
	@IBOutlet weak var leftView: UIView!
	@IBOutlet weak var archiveIconView: UIImageView!
	@IBOutlet weak var deleteIconView: UIImageView!
	@IBOutlet weak var listIconView: UIImageView!
	@IBOutlet weak var rightView: UIView!
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var feedView: UIImageView!
	@IBOutlet weak var menuButton: UIButton!
	@IBOutlet weak var laterIconView: UIImageView!
	@IBOutlet weak var composeButton: UIButton!
	@IBOutlet weak var composeBackground: UIView!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var cancelButton: UIButton!
	
	@IBOutlet weak var composeView: UIView!
	@IBOutlet weak var leftBackground: UIView!
	@IBOutlet weak var leftBackground2: UIView!
	@IBOutlet weak var rightBackground: UIView!
	@IBOutlet weak var rightBackground2: UIView!
	
	@IBOutlet weak var rescheduleView: UIImageView!
	@IBOutlet weak var rescheduleListView: UIView!
	@IBOutlet weak var rescheduleButton: UIButton!
	
	@IBOutlet weak var SegmentedControl: UISegmentedControl!
	@IBOutlet weak var allViews: UIView!
	
	@IBOutlet weak var scrollView2: UIScrollView!
	var messageOriginalCenter: CGPoint!
	var leftOriginalCenter: CGPoint!
	var rightOriginalCenter: CGPoint!
	var firstViewOriginalCenter: CGPoint!
	var scrollViewOriginalCenter:CGPoint!
	var inboxListOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
		SegmentedControl.selectedSegmentIndex = 1
		scrollView.contentSize = feedView.image!.size
		scrollView2.contentSize.width = 960
		
		// Add edgeGesture Recognizer
		let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
		edgeGesture.edges = UIRectEdge.Left
		firstView.addGestureRecognizer(edgeGesture)
		
		// Hide the icons
		listIconView.alpha = 0
		deleteIconView.alpha = 0
		archiveIconView.alpha = 0
		archiveIconView.alpha = 0
		leftBackground.alpha = 0
		rightBackground.alpha = 0
		leftBackground2.alpha = 0
		rightBackground2.alpha = 0
		rescheduleListView.alpha = 0
		composeBackground.alpha = 0
		

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func onPan(sender: UIPanGestureRecognizer) {
		
		let translation = panGestureRecognizer.translationInView(view)
		let velocity = panGestureRecognizer.velocityInView(view)
		
		let a = abs(translation.x)/65
		
		if  panGestureRecognizer.state == UIGestureRecognizerState.Began {
			messageOriginalCenter = messageView.center
			leftOriginalCenter = leftView.center
			rightOriginalCenter = rightView.center
			scrollViewOriginalCenter = scrollView.center
			
		}else if  panGestureRecognizer.state == UIGestureRecognizerState.Changed {
			
			messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x , y: messageOriginalCenter.y)
			
			if translation.x >= -65 && translation.x < 0{
				laterIconView.alpha = a
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.listIconView.alpha = 0
					self.rightBackground.alpha = 0
					self.rightBackground2.alpha = 0
				})

				
			} else if translation.x > -220 && translation.x < -65 {
				rightView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 320, y: rightOriginalCenter.y)
				leftView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 320, y: rightOriginalCenter.y)
				
				
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.listIconView.alpha = 0
					self.laterIconView.alpha = 1
					self.rightBackground.alpha = 1
					self.rightBackground2.alpha = 0
				})

			
			
			} else if translation.x <= -220 {
				
				rightView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 320, y: leftOriginalCenter.y)
				leftView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 320, y: rightOriginalCenter.y)
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.laterIconView.alpha = 0
					self.listIconView.alpha = 1
					self.rightBackground.alpha = 0
					self.rightBackground2.alpha = 1
				})
				
			
			} else if translation.x > 0 && translation.x <= 65 {
				archiveIconView.alpha = a
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.deleteIconView.alpha = 0
					self.leftBackground.alpha = 0
					self.leftBackground2.alpha = 0
				})
			
			
			} else if translation.x > 65 && translation.x < 220 {
				
				leftView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 320, y: rightOriginalCenter.y)
				rightView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 320, y: rightOriginalCenter.y)
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.deleteIconView.alpha = 0
					self.archiveIconView.alpha = 1
					self.leftBackground.alpha = 1
					self.leftBackground2.alpha = 0
				})
				
			}else if translation.x >= 220 {
				
				leftView.center = CGPoint(x: messageOriginalCenter.x + translation.x - 320, y: leftOriginalCenter.y)
				rightView.center = CGPoint(x: messageOriginalCenter.x + translation.x + 320, y: rightOriginalCenter.y)
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.archiveIconView.alpha = 0
					self.deleteIconView.alpha = 1
					self.leftBackground.alpha = 0
					self.leftBackground2.alpha = 1
				})
				
				
			}else{
				leftView.center = CGPoint(x: leftOriginalCenter.x, y: leftOriginalCenter.y)
				rightView.center = CGPoint(x: rightOriginalCenter.x, y: rightOriginalCenter.y)
			}
		
		
		} else if  panGestureRecognizer.state == UIGestureRecognizerState.Ended {
			
			if  velocity.x > 0 && translation.x < 65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x , y: self.messageOriginalCenter.y)
				})
				
			
			} else if velocity.x >= 0 && translation.x >= 65 {
				
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x + 320, y: self.messageOriginalCenter.y)
					self.leftView.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
					
					}, completion: { (Bool) -> Void in
						UIView.animateWithDuration(0.2, animations: { () -> Void in
							self.scrollView.center = CGPoint(x: self.scrollViewOriginalCenter.x, y: self.scrollViewOriginalCenter.y-86)
						})
				})
				
			
			} else if velocity.x < 0 && translation.x > -65 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
				})
				
			} else if velocity.x < 0 && translation.x <= -65 {
				
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.messageView.center = CGPoint(x: self.messageOriginalCenter.x - 320, y: self.messageOriginalCenter.y)
					self.rightView.center = CGPoint(x: self.messageOriginalCenter.x, y: self.messageOriginalCenter.y)
					
					}, completion: { (Bool) -> Void in
						UIView.animateWithDuration(0.2, animations: { () -> Void in
							self.rescheduleListView.alpha = 1
						})
				})
				
			}
			
		}

	}
	
	@IBAction func onRescheduleClicked(sender: AnyObject) {
		scrollViewOriginalCenter = scrollView.center
		
		UIView.animateWithDuration(0.2, animations: { () -> Void in
			self.rescheduleListView.alpha = 0
			
			}, completion: { (Bool) -> Void in
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.scrollView.center = CGPoint(x: self.scrollViewOriginalCenter.x, y: self.scrollViewOriginalCenter.y-86)
				})
		})
	}
	
	
	func onEdgePan(edgeGesture: UIScreenEdgePanGestureRecognizer){
		
		let edgeTranslation = edgeGesture.translationInView(view)
		let edgeVelocity = edgeGesture.velocityInView(view)
		
		if edgeGesture.state == UIGestureRecognizerState.Began{
			
			firstViewOriginalCenter = firstView.center
			
		} else if edgeGesture.state == UIGestureRecognizerState.Changed{
			
			firstView.center = CGPoint(x: 160 + edgeTranslation.x, y: firstViewOriginalCenter.y)
			
		} else if edgeGesture.state == UIGestureRecognizerState.Ended{
			let menuPanGesture = UIPanGestureRecognizer(target: self, action: "onCloseMenuPan:")
			
			
			if edgeVelocity.x > 0 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.firstView.center = CGPoint(x: 450, y: self.firstViewOriginalCenter.y)
					self.firstView.addGestureRecognizer(menuPanGesture)
					
				})
				
			} else {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.firstView.center = CGPoint(x: 160, y: self.firstViewOriginalCenter.y)
					self.firstView.removeGestureRecognizer(menuPanGesture)
				})
			}
			
		}

	}
	
	
	
	
	
	
	@IBAction func onButtonClicked(sender: AnyObject) {
		UIView.animateWithDuration(0.2) { () -> Void in
			
			let menuPanGesture = UIPanGestureRecognizer(target: self, action: "onCloseMenuPan:")
			
			self.firstView.center = CGPoint(x: 450, y: 284)
			self.firstView.addGestureRecognizer(menuPanGesture)
		}
	}
	
	
	func onCloseMenuPan(menuPanGesture: UIPanGestureRecognizer){
		let menuPanTranslation = menuPanGesture.translationInView(view)
		let menuPanVelocity = menuPanGesture.velocityInView(view)
		
		if menuPanGesture.state == UIGestureRecognizerState.Began{
			firstViewOriginalCenter = firstView.center
			
		}else if menuPanGesture.state == UIGestureRecognizerState.Changed{
			
			firstView.center = CGPoint(x: firstViewOriginalCenter.x + menuPanTranslation.x, y: firstViewOriginalCenter.y)
			
		}else if menuPanGesture.state == UIGestureRecognizerState.Ended{
			
			if menuPanVelocity.x < 0 {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.firstView.center = CGPoint(x: 160, y: self.firstViewOriginalCenter.y)
					self.firstView.removeGestureRecognizer(menuPanGesture)
					
				})
				
			} else {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.firstView.center = CGPoint(x: 450, y: self.firstViewOriginalCenter.y)
					self.firstView.addGestureRecognizer(menuPanGesture)
				})
			}
			
		}
	}
	
	@IBAction func onValueChanged(sender: AnyObject) {
		
		if SegmentedControl.selectedSegmentIndex == 0 {
			UIView.animateWithDuration(0.2, animations: { () -> Void in
				self.scrollView2.contentOffset.x = -320
			})
			
		} else if SegmentedControl.selectedSegmentIndex == 1 {
			
			UIView.animateWithDuration(0.2, animations: { () -> Void in
				self.scrollView2.contentOffset.x = 0

			})
			
		}
		else if SegmentedControl.selectedSegmentIndex == 2 {
			UIView.animateWithDuration(0.2, animations: { () -> Void in
				self.scrollView2.contentOffset.x = 320
			})
			
		}
	}
	
	@IBAction func onComposeButtonClicked(sender: AnyObject) {
		UIView.animateWithDuration(0.2) { () -> Void in
			self.composeView.transform = CGAffineTransformMakeTranslation(0, -504)
			self.composeBackground.alpha = 0.2
			self.textField.becomeFirstResponder()
		}
	}

	@IBAction func onCancelClicked(sender: AnyObject) {
		UIView.animateWithDuration(0.2) { () -> Void in
			self.composeView.transform = CGAffineTransformMakeTranslation(0, 504)
			self.composeBackground.alpha = 0
			self.textField.endEditing(true)
		}

		
	}



}
