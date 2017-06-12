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
        
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        self.navigationController?.navigationBar.topItem?.title = "Daily Spell"
        
        configureCollectionView ()
    }
    
    func configureCollectionView () {
        loadJSONFile()
        self.collectionView?.autoresizesSubviews            = true
        self.collectionView?.showsVerticalScrollIndicator   = false
        self.clearsSelectionOnViewWillAppear                = false
    }
    
    func loadJSONFile () {
        if let path = Bundle.main.path(forResource: "spellings", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    guard let jsonWithSpellings: JSONDictionary = jsonResult as? JSONDictionary else {return}
                    
                    self.words = Spellings(spells: jsonWithSpellings as NSDictionary)
                } catch {
                    print("Some error at spellings JSONSerialization")
                }
            } catch {
                print("Some error at spellings.json")
            }
        }
    }


    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.words.word.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SpellingsCollectionVCell else {
            return UICollectionViewCell()
        }
        
        // Configure the cell
        cell.spellingLevelLabel.text            = self.words.word[indexPath.item]
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SpellingsVC") as? SpellingsVC
            else {
            print("Could not instantiate view controller with identifier of type SpellingsVC")
            return
        }
        // vc.resultsArray = self.resultsArray // Data to be transfered.
        self.navigationController?.pushViewController(vc, animated:true)
    }
}

extension SpellingsCollectionVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 145)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.00
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.00
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TOP LEFT BOTTOM RIGHT
        return UIEdgeInsetsMake(30, 30, 30, 30)
    }
}
