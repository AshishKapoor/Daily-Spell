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
        
        spellingLevelLabel.text = "Loading..."
        
        spellingLevelImage.backgroundColor      = UIColor.random()
        spellingLevelImage.layer.cornerRadius   = 72.00
        spellingLevelLabel.textColor            = UIColor.white
        spellingLevelLabel.font                 = UIFont.systemFont(ofSize: 18, weight: UIFontWeightBold)
        
    }
}
