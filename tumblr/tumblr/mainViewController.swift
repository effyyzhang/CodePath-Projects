//
//  mainViewController.swift
//  tumblr
//
//  Created by Effy Zhang on 10/10/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {
	

	@IBOutlet weak var contentView: UIView!
	@IBOutlet var buttons: [UIButton]!
	@IBOutlet weak var exploreTab: UIImageView!
	
	var homeViewController: UIViewController!
	var searchViewController: UIViewController!
	var trendingViewController: UIViewController!
	var accountViewController: UIViewController!
	var viewControllers: [UIViewController]!
	
	var selectedIndex: Int = 0
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewController")
		searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewController")
		trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewController")
		accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewController")
		
		viewControllers = [homeViewController,searchViewController,trendingViewController,accountViewController]
		

		
		buttons[selectedIndex].selected = true
		didPress(buttons[selectedIndex])

		

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(animated: Bool) {
		UIView.animateWithDuration(0.8, delay: 0.4, options:[ .Autoreverse, .Repeat, .CurveEaseInOut ], animations: { () -> Void in
			
			self.exploreTab.transform = CGAffineTransformMakeTranslation(0, +15)
			
			}, completion: nil)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func didPress(sender: UIButton) {
		let previousIndex = selectedIndex
		selectedIndex = sender.tag
		buttons[previousIndex].selected = false
		
		let previousVC = viewControllers[previousIndex]
		
		previousVC.willMoveToParentViewController(nil)
		previousVC.view.removeFromSuperview()
		previousVC.removeFromParentViewController()
		
		
		sender.selected = true
		
		let vc = viewControllers[selectedIndex]
		
		addChildViewController(vc)
		vc.view.frame = contentView.bounds
		contentView.addSubview(vc.view)
		
		vc.didMoveToParentViewController(self)

	}
	
	@IBAction func onSearchClicked(sender: AnyObject) {
		exploreTab.removeFromSuperview()
	}
	
	

}
