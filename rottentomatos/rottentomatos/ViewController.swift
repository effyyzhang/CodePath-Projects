//
//  ViewController.swift
//  rottentomatos
//
//  Created by Effy Zhang on 10/20/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var data: [NSDictionary]!

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		data = []
		
		let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us")
		
		let request = NSURLRequest(URL: url!)
		NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse?, data:NSData?, error: NSError?) -> Void in
			
			let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
			
			print(json)
			
			self.data = json ["movies"] as! [NSDictionary]
			self.tableView.reloadData()
		
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as! MovieCell
		
		let movies = data[indexPath.row]
		let title = movies.valueForKeyPath("title") as! String
		let synopsis = movies.valueForKeyPath("synopsis") as! String
		let urlString = movies.valueForKeyPath("posters.thumbnail") as! String
		let url = NSURL(string: urlString)!
		
		cell.titleLable.text = title
		cell.synopsisLabel.text = synopsis
		cell.posterImageView.setImageWithURL(url)
		
		return cell
	}

}

