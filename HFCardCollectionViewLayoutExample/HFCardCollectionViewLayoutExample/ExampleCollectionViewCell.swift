//
//  ExampleCollectionViewCell.swift
//  HFCardCollectionViewLayoutExample
//
//  Created by Hendrik Frahmann on 02.11.16.
//  Copyright © 2016 Hendrik Frahmann. All rights reserved.
//

import UIKit
import QuartzCore

class ExampleCollectionViewCell: HFCardCollectionViewCell, HFCardCollectionViewCellDelegate {
    
    var cardCollectionViewLayout: HFCardCollectionViewLayout?
    
    @IBOutlet var buttonFlip: UIButton?
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var backView: UIView?
    @IBOutlet var buttonFlipBack: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.buttonFlip?.isHidden = true
        self.tableView?.scrollsToTop = false
    }
    
    func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, hasCardSelected isSelected: Bool) {
        self.cardCollectionViewLayout = collectionViewLayout
        self.buttonFlip?.isHidden = !isSelected
        self.tableView?.scrollsToTop = isSelected
    }
    
    @IBAction func buttonFlipAction() {
        if let backView = self.backView {
            // Same Corner radius like the contentview of the HFCardCollectionViewCell
            backView.layer.cornerRadius = 10
            backView.layer.masksToBounds = true
            
            self.cardCollectionViewLayout?.flipSelectedCard(toView: backView)
        }
    }
    
    
}
