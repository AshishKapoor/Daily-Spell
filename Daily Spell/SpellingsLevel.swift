//
//  SpellingsLevel.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 09/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import Foundation

class SpellingsLevel: NSObject {
    
    var levelNumber: Int?
    var levelImage: String?
    
    init(levelInformation: JSONDictionary) {
        super.init()
        
        guard let _levelNumber = levelInformation["levelNumber"] as? Int else {
            self.levelNumber = 0
            return
        }
        self.levelNumber = _levelNumber
        
        guard let _levelImage = levelInformation["levelImage"] as? String else {
            self.levelImage = ""
            return
        }
        self.levelImage = _levelImage
    }
    
    func lockedlevel() -> JSONDictionary {
        var jsonDictionary = JSONDictionary()
        self.levelNumber = nil
        self.levelImage = ""
        
        jsonDictionary.updateValue(self.levelNumber as JSON, forKey: "levelNumber")
        jsonDictionary.updateValue(self.levelImage as JSON, forKey: "levelImage")
        
        return jsonDictionary
    }
    
}
