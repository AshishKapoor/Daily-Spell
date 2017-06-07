//
//  ViewController.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 07/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import UIKit

class SpellingsVC: UIViewController {

    @IBOutlet weak var spellingLabel: UILabel!
    
    var words: [Spellings] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readLocallyStoredJsonFile()
        title = "Daily Spell"
        print(words.count)
        spellingLabel.text = "Delicious"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = UIColor.random()
    }
    
    func readLocallyStoredJsonFile () {
        if let path = Bundle.main.path(forResource: "spellings", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let spellings = jsonResult["spellings"] as? [String: Any] {
                        for spelling in spellings {
                            Spellings(words: spelling.value as! String)
                        }
                    }
                } catch {}
            } catch {}
        }
    }
    
}



extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

