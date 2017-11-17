//
//  HFCardCollectionView.swift
//  Pods
//
//  Created by Hendrik Frahmann on 02.04.17.
//
//

import UIKit

class HFCardCollectionView: UICollectionView {

    override open func insertItems(at indexPaths: [IndexPath]) {
        if let collectionViewLayout = self.collectionViewLayout as? HFCardCollectionViewLayout {
            collectionViewLayout.willInsert(indexPaths: indexPaths)
        }
        super.insertItems(at: indexPaths)
    }
    
    override open func deleteItems(at indexPaths: [IndexPath]) {
        if let collectionViewLayout = self.collectionViewLayout as? HFCardCollectionViewLayout {
            collectionViewLayout.willDelete(indexPaths: indexPaths)
        }
        super.deleteItems(at: indexPaths)
    }
    
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
