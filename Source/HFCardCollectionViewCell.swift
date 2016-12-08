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
open class HFCardCollectionViewCell: UICollectionViewCell {
    
    @IBInspectable open var cornerRadius: CGFloat = 10
    
    private var firstBackgroundColor: UIColor?
    
    // MARK: Overrides
    
    /// Overwritten to setup the view
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupLayer(self)
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = self.cornerRadius
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = self.firstBackgroundColor
    }
    
    /// Overwritten to pass the backgroundColor to contentView and keep the cell itself transparent.
    override open var backgroundColor: UIColor? {
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
    
    /// Overwritten to update the shadowPath.
    override open var bounds: CGRect {
        didSet {
            let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
            self.layer.shadowPath = shadowPath
        }
    }
    
    /// Overwritten to create a better snapshot.
    ///
    /// The HFCardCollectionViewLayout will create a snapshot of this cell as the moving card view.
    /// This Function will recreate the shadows to the snapshotView.
    override open func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView? {
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
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius).cgPath
        forView.layer.shadowPath = shadowPath
        forView.layer.masksToBounds = false
        forView.layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
        forView.layer.shadowRadius = 2
        forView.layer.shadowOpacity = 0.35
        forView.layer.shadowOffset = CGSize(width: 0, height: 0)
        forView.layer.rasterizationScale = UIScreen.main.scale
        forView.layer.shouldRasterize = true
        forView.clipsToBounds = false
    }
    
}
