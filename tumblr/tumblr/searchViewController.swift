//
//  searchViewController.swift
//  tumblr
//
//  Created by Effy Zhang on 10/10/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {
	@IBOutlet weak var loadingView: UIView!
	
	@IBOutlet weak var ImageView: UIImageView!
	@IBOutlet weak var searchFeed: UIImageView!
	var loading_1: UIImage!
	var loading_2: UIImage!
	var loading_3: UIImage!
	
	var images: [UIImage]!
	var animatedImage: UIImage!
	
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		loading_1 = UIImage(named: "loading-1")
		loading_2 = UIImage(named: "loading-2")
		loading_3 = UIImage(named: "loading-3")
		
		images = [loading_1, loading_2, loading_3]
		animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
		
		ImageView.image = animatedImage
		

		delay(2){

					self.loadingView.removeFromSuperview()

		
		}
		
		
		

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
