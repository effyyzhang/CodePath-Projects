//
//  MovieCell.swift
//  rottentomatos
//
//  Created by Effy Zhang on 10/20/15.
//  Copyright © 2015 Effy Zhang. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

	@IBOutlet weak var posterImageView: UIImageView!
	@IBOutlet weak var titleLable: UILabel!
	@IBOutlet weak var synopsisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
