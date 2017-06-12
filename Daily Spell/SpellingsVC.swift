//
//  ViewController.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 07/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import UIKit
import DMSwipeCards

class SpellingsVC: UIViewController {
    
    private var swipeView: DMSwipeCardsView<String>!
    private var count = 0
    
    
    var summaryDetail: String?
    var meaningDetail: String?
    var imageURLDetail: String?
    var wordDetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCardsView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setupView () {
        title = self.wordDetail
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }
    
    func setupCardsView () {
        
        let viewGenerator: (String, CGRect) -> (UIView) = { (element: String, frame: CGRect) -> (UIView) in
            let container = UIView(frame: CGRect(x: 30, y: 20, width: frame.width - 60, height: frame.height - 40))
            let label = UILabel(frame: container.bounds)
            label.text = self.meaningDetail
            label.textAlignment = .center
            label.backgroundColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 13, weight: UIFontWeightThin)
            label.clipsToBounds = true
            label.layer.cornerRadius = 16
            container.addSubview(label)
            
            container.layer.shadowRadius = 4
            container.layer.shadowOpacity = 1.0
            container.layer.shadowColor = UIColor(white: 0.9, alpha: 1.0).cgColor
            container.layer.shadowOffset = CGSize(width: 0, height: 0)
            container.layer.shouldRasterize = true
            container.layer.rasterizationScale = UIScreen.main.scale
            return container
        }
        
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 160)
        swipeView = DMSwipeCardsView<String>(frame: frame, viewGenerator: viewGenerator, overlayGenerator: nil)
        swipeView.delegate = self
        self.view.addSubview(swipeView)
        
        buttonTapped()
    }
    
    func buttonTapped() {
        self.swipeView.addCards((self.count...(self.count+2)).map({"\($0)"}), onTop: true)
        self.count = self.count + 2
    }
}

extension SpellingsVC: DMSwipeCardsViewDelegate {
    func swipedLeft(_ object: Any) {
        print("Swiped left: \(object)")
    }
    
    func swipedRight(_ object: Any) {
        print("Swiped right: \(object)")
    }
    
    func cardTapped(_ object: Any) {
        print("Tapped on: \(object)")
    }
    
    func reachedEndOfStack() {
        print("Reached end of stack")
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



//        let overlayGenerator: (SwipeMode, CGRect) -> (UIView) = { (mode: SwipeMode, frame: CGRect) -> (UIView) in
//            let label = UILabel()
//            label.frame.size = CGSize(width: 100, height: 100)
//            label.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
//            label.layer.cornerRadius = label.frame.width / 2
//            label.backgroundColor = mode == .left ? UIColor.red : UIColor.green
//            label.text = mode == .left ? "👍" : "👎"
//            label.clipsToBounds = true
//            label.font = UIFont.systemFont(ofSize: 24)
//            label.textAlignment = .center
//            return label
//        }
