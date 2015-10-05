//
//  ViewController.swift
//  Mailbox
//
//  Created by Effy Zhang on 10/3/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var feedImage: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		scrollView.contentSize = feedImage.image!.size
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

