//
//  Spellings.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 07/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import Foundation

class Spellings: NSObject {
    
    private var _spellings: [String] = []
    
    // Init with spells
    init (spells: NSDictionary) {
        
        guard let words = spells["spellings"] as? [String: Any] else {
            print("can't consume words from spellings json")
            return
        }
        for spelling in words {
            self._spellings.append((spelling.value as? String)!)
        }
    }
    
    // Empty init
    override init() {
    }
    
    // Getters
    var spellings: [String] {
        return _spellings
    }
    
}
