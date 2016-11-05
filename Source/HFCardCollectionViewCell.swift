//
//  HFCardCollectionViewCell.swift
//  HFCardCollectionViewLayout
//
//  Created by Hendrik Frahmann on 02.11.16.
//  Copyright © 2016 Hendrik Frahmann. All rights reserved.
//

import UIKit
import QuartzCore

/// An UICollectionViewCell for the HFCardCollectionViewLayout.
///
/// This Cell has no dependency on the HFCardCollectionViewLayout.
/// So you can create your own UICollectionViewCell without extending from this class.
public class HFCardCollectionViewCell: UICollectionViewCell {
    
    private var firstBackgroundColor: UIColor?
    
    // MARK: Overrides
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupLayer(self)
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = self.firstBackgroundColor
    }
    
    // Pass the backgroundColor to contentView
    override public var backgroundColor: UIColor? {
        set {
            if(self.firstBackgroundColor == nil) {
                self.firstBackgroundColor = newValue
            }
            super.backgroundColor = .clear
            self.contentView.backgroundColor = newValue
        }
        get {
            return self.contentView.backgroundColor
        }
    }
    
    override public var bounds: CGRect {
        didSet {
            let shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shadowPath = shadowPath
        }
    }
    
    // The HFCardCollectionViewLayout will create a snapshot of this cell as the moving card view.
    // This Function will recreate the shadows to the snapshotView.
    override public func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView? {
        let snapshotView = UIView(frame: self.frame)
        if let snapshotOfContentView = self.contentView.snapshotView(afterScreenUpdates: afterUpdates) {
            snapshotView.addSubview(snapshotOfContentView)
        }
        self.setupLayer(snapshotView)
        return snapshotView
    }
    
    // MARK: Private Functions
    
    private func setupLayer(_ forView: UIView) {
        // Shadow can have performance issues on older devices
        let shadowPath = UIBezierPath(rect: self.bounds).cgPath
        forView.layer.shadowPath = shadowPath
        forView.layer.masksToBounds = false
        forView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.2).cgColor
        forView.layer.shadowRadius = 2
        forView.layer.shadowOpacity = 1.0
        forView.layer.shadowOffset = CGSize(width: 0, height: 0)
        forView.layer.rasterizationScale = UIScreen.main.scale
        forView.layer.shouldRasterize = true
        forView.clipsToBounds = false
    }
    
}
