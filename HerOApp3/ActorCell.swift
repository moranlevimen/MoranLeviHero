//
//  ActorCell.swift
//  HerOApp3
//
//  Created by moran levi on 28/06/2018.
//  Copyright © 2018 LeviMoran. All rights reserved.
//

import UIKit
extension UIImageView {
    
    func makeRounded() {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

class ActorCell: UITableViewCell {
    @IBOutlet var imageActor: UIImageView!
    
    @IBOutlet var nickNameLbl: UILabel!

    @IBOutlet var yobLbl: UILabel!
    
    @IBOutlet var powersLbl: UILabel!
    
    @IBOutlet var originalActorsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
