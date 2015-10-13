//
//  trendingViewController.swift
//  tumblr
//
//  Created by Effy Zhang on 10/10/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class trendingViewController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	
	@IBOutlet weak var scrollFeed: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.contentSize = scrollFeed.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
