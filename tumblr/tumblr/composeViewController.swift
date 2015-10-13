//
//  composeViewController.swift
//  tumblr
//
//  Created by Effy Zhang on 10/10/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class composeViewController: UIViewController {
	@IBOutlet weak var cancelButton: UIButton!

	@IBOutlet weak var tile1View: UIImageView!
	@IBOutlet weak var tile2View: UIImageView!
	@IBOutlet weak var tile3View: UIImageView!
	@IBOutlet weak var tile4View: UIImageView!
	@IBOutlet weak var tile5View: UIImageView!
	@IBOutlet weak var tile6View: UIImageView!
	
	var tileOriginalY: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
		

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		self.view.backgroundColor = UIColor(red: 49/255, green: 67/255, blue: 86/255, alpha: 0.5)
	}
	override func viewDidAppear(animated: Bool) {
		updateViewTransformsWithOffset1()

	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func onButtonPress(sender: AnyObject) {
		
		updateViewTransformsWithOffset2()
		UIView.animateWithDuration(0.3) { () -> Void in
			self.view.backgroundColor = UIColor(red: 49/255, green: 67/255, blue: 86/255, alpha: 0)
		}
		
		
	}
	
	func updateViewTransformsWithOffset1(){
		let tiles = [tile2View,tile1View,tile3View,tile5View,tile4View,tile6View]
		
		for index in 0...5 {
			let tile = tiles[index]
			
			UIView.animateWithDuration(0.3, delay: Double(index) * 0.05, usingSpringWithDamping:  0.75, initialSpringVelocity: 10, options: [], animations: { () -> Void in
				tile.transform = CGAffineTransformMakeTranslation(0, -500)
				}, completion: { (Bool) -> Void in
					UIView.animateWithDuration(0.3, delay: 0.4, options: .CurveEaseOut, animations: { () -> Void in
						self.cancelButton.transform = CGAffineTransformMakeTranslation(0, -53)
						}, completion: nil)
			})
		}
		
	}
	
	func updateViewTransformsWithOffset2(){
		let tiles = [tile2View,tile1View,tile3View,tile5View,tile4View,tile6View]
		
		for index in 0...5 {
			let tile = tiles[index]
			
			UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
				self.cancelButton.transform = CGAffineTransformMakeTranslation(0, +53)
				
				}, completion: { (Bool) -> Void in
					UIView.animateWithDuration(0.2, delay: Double(index) * 0.05, usingSpringWithDamping: 0.75, initialSpringVelocity: 10, options: [], animations: { () -> Void in
						tile.transform = CGAffineTransformMakeTranslation(0, +500)
						
						}, completion: { (Bool) -> Void in
							self.dismissViewControllerAnimated(true, completion: nil)
					})
			})
			
		}
		
	}

}
