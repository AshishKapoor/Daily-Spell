//
//  SpellingsCollectionVCell.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 09/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import UIKit

class SpellingsCollectionVCell: UICollectionViewCell {
    
    @IBOutlet weak var spellingLevelImage: UIImageView!
    @IBOutlet weak var spellingLevelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spellingLevelImage.image = UIImage(named: "icons8-lock")
        spellingLevelLabel.text = "Testing..."
    }
}
