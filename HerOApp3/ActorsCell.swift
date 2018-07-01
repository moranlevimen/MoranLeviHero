//
//  ActorsCell.swift
//  HerOApp3
//
//  Created by moran levi on 29/06/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit

class ActorsCell: UITableViewCell {

    
    @IBOutlet var nameCell: UILabel!
   
    @IBOutlet var yearCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
