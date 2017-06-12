//
//  Spellings.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 07/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import Foundation

class Spellings: NSObject {
    
    private var _spellings: [JSONDictionary]    = []
    
    private var _word: [String]         = []
    private var _meaning: [String]      = []
    private var _imageURL: [String]     = []
    private var _summary: [String]      = []
    
    // Init with spells
    init (spells: NSDictionary) {
        super.init()
        guard let words = spells["spellings"] as? [String: Any] else {
            print("can't consume words from spellings json")
            return
        }
        
        for (_, value) in words {
            self._spellings.append((value as? JSONDictionary)!)
        }
        
        for spelling in self._spellings {
            guard let summary = spelling["summary"] as? String else { return }
            _summary.append(summary)
            
            guard let word = spelling["word"] as? String else { return }
            _word.append(word)
            
            guard let imageURL = spelling["image"] as? String else { return }
            _imageURL.append(imageURL)
            
            guard let meaning = spelling["meaning"] as? String else { return }
            _meaning.append(meaning)
        }

        
    }
    
    // Empty init
    override init() {
    
    }
    
    // Getters
    var word: [String] {
        return _word
    }
    
    var summary: [String] {
        return _summary
    }
    
    var imageURL: [String] {
        return _imageURL
    }
    
    var meaning: [String] {
        return _meaning
    }
    
}
