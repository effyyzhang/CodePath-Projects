//
//  feedsViewController.swift
//  Carousel
//
//  Created by Effy Zhang on 9/27/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class feedsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var closeBannerButton: UIButton!
    
    var initialY:CGFloat!
    let offset: CGFloat = -64
    
    var initialY1:CGFloat!
    let offset1: CGFloat = -44
    
    var initialX:CGFloat!
    let offsetX: CGFloat = 320
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedImage.image!.size
        initialY = bannerView.frame.origin.y
        initialY1 = scrollView.frame.origin.y
        initialX = bannerView.frame.origin.x
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        bannerView.addGestureRecognizer(leftSwipe)
        bannerView.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onCloseBannerButtonClicked(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.bannerView.frame.origin = CGPoint(x: self.bannerView.frame.origin.x, y: self.initialY + self.offset)
            self.scrollView.frame.origin = CGPoint(x: self.scrollView.frame.origin.x, y: self.initialY1 + self.offset1)
            self.bannerView.alpha = 0
            
        })

    }

    func handleSwipes (sender: UISwipeGestureRecognizer){
        
        if (sender.direction == .Left){
            
            UIView.animateWithDuration(0.3, animations: {
                self.bannerView.frame.origin = CGPoint(x: self.bannerView.frame.origin.x - self.offsetX, y: self.initialY)
                self.scrollView.frame.origin = CGPoint(x: self.scrollView.frame.origin.x, y: self.initialY1 + self.offset1)
                self.bannerView.alpha = 0})
        }
        
        if (sender.direction == .Right){
            
            UIView.animateWithDuration(0.3, animations: {
                self.bannerView.frame.origin = CGPoint(x: self.bannerView.frame.origin.x + self.offsetX, y: self.initialY)
                self.scrollView.frame.origin = CGPoint(x: self.scrollView.frame.origin.x, y: self.initialY1 + self.offset1)
                self.bannerView.alpha = 0})
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
