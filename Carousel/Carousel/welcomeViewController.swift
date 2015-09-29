//
//  welcomeViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/27/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page: Int = Int(round(scrollView.contentOffset.x/320))
        
        // Set the current page, so the dots will update
     pageControl.currentPage = page
    }

}
