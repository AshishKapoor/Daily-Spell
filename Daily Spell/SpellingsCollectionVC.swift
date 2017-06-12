//
//  SpellingsCollectionVC.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 09/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SpellMenuCell"

class SpellingsCollectionVC: UICollectionViewController {
    
    var words = Spellings()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spellings"
        
        loadJSONFile()
        
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

    }
    
    func loadJSONFile () {
        if let path = Bundle.main.path(forResource: "spellings", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary

                    self.words = Spellings(spells: jsonResult)
                    
                    print(self.words.spellings)
                    
                } catch {}
            } catch {}
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.words.spellings.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SpellingsCollectionVCell else {return UICollectionViewCell()}
        // Configure the cell
        cell.spellingLevelImage.image = UIImage(named: "icons8-lock")
        cell.spellingLevelLabel.text = self.words.spellings[indexPath.item]
        cell.spellingLevelLabel.textColor = UIColor.black
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SpellingsVC") as? SpellingsVC
            else {
            print("Could not instantiate view controller with identifier of type SpellingsVC")
            return
        }
        
        // vc.resultsArray = self.resultsArray
        self.navigationController?.pushViewController(vc, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
