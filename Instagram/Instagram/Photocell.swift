//
//  Photocell.swift
//  Instagram
//
//  Created by Effy Zhang on 10/20/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class Photocell: UITableViewCell {

	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var photoImageView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
