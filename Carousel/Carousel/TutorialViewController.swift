//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/27/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        self.buttonBackgroundView.alpha = 0
        self.pageControl.alpha = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
    }
    func scrollViewDidScroll(scrollView: UIScrollView){
        let offset = Float(scrollView.contentOffset.x)
        //print("content offset: \(offset)")
        
        if offset >= 960 {
            UIView.animateWithDuration(0.4, animations: {
                self.buttonBackgroundView.alpha = 1
            })
            
            self.pageControl.alpha = 0
        }
        else {
            self.buttonBackgroundView.alpha = 0
            self.pageControl.alpha = 1
        }
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
