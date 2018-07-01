//
//  ActorsCell.swift
//  HerOApp3
//
//  Created by moran levi on 01/07/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit

class ActorsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var yearLbl: UILabel!
    @IBOutlet var movieLbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
