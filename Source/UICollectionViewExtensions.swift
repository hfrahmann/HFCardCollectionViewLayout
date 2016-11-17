//
//  UICollectionViewExtensions.swift
//  Pods
//
//  Created by Hendrik Frahmann on 17.11.16.
//
//

import UIKit

/// Extension to add special behaviour for HFCardCollectionViewLayout
extension UICollectionView {
    
    /// Overwritten to prevent default behaviour of 'installsStandardGestureForInteractiveMovement = true'.
    ///
    /// - Parameter gestureRecognizer: An object whose class descends from the UIGestureRecognizer class. This parameter must not be nil.
    override open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if let collectionViewLayout = self.collectionViewLayout as? HFCardCollectionViewLayout {
            let gestureClassName = String(describing: type(of: gestureRecognizer))
            let gestureString = String(describing: gestureRecognizer)
            // Prevent default behaviour of 'installsStandardGestureForInteractiveMovement = true' and install a custom reorder gesture recognizer.
            if(gestureClassName == "UILongPressGestureRecognizer" && gestureString.range(of: "action=_handleReorderingGesture") != nil) {
                collectionViewLayout.installMoveCardsGestureRecognizer()
                return
            }
        }
        super.addGestureRecognizer(gestureRecognizer)
    }
    
    
    /// Overwritten to ignore the contentOffset change when scrolling is disabled.
    ///
    /// - Parameter contentOffset: A point (expressed in points) that is offset from the content view’s origin.
    /// - Parameter animated: true to animate the transition at a constant velocity to the new offset, false to make the transition immediate.
    override open func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        if self.collectionViewLayout is HFCardCollectionViewLayout {
            if(self.isScrollEnabled == true) {
                super.setContentOffset(contentOffset, animated: animated)
            }
        } else {
            super.setContentOffset(contentOffset, animated: animated)
        }
    }
    
}

/// Extension to add special behaviour for HFCardCollectionViewLayout
extension UICollectionViewCell {
    
    /// Important for updating the Z index and setting the flag 'isUserInteractionEnabled'
    ///
    /// - Parameter layoutAttributes: The new layout attributes
    override open func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let cardLayoutAttributes = layoutAttributes as? HFCardCollectionViewLayoutAttributes {
            self.layer.zPosition = CGFloat(cardLayoutAttributes.zIndex)
            self.contentView.isUserInteractionEnabled = cardLayoutAttributes.isRevealed
        } else {
            self.contentView.isUserInteractionEnabled = true
        }
    }
    
}
