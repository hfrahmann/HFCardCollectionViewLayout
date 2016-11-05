//
//  HFCardCollectionView.swift
//  HFCardCollectionViewLayout
//
//  Created by Hendrik Frahmann on 05.11.16.
//  Copyright © 2016 Hendrik Frahmann. All rights reserved.
//

import UIKit

open class HFCardCollectionView: UICollectionView {

    open override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
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
    
    open override func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        if self.collectionViewLayout is HFCardCollectionViewLayout {
            if(self.isScrollEnabled == true) {
                super.setContentOffset(contentOffset, animated: animated)
            }
        } else {
            super.setContentOffset(contentOffset, animated: animated)
        }
    }

}
