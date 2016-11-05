//
//  HFCardCollectionViewLayoutDelegate.swift
//  HFCardCollectionViewLayout
//
//  Created by Hendrik Frahmann on 05.11.16.
//  Copyright © 2016 Hendrik Frahmann. All rights reserved.
//

import UIKit

@objc public protocol HFCardCollectionViewLayoutDelegate : UICollectionViewDelegate {
    
    /// Asks if the card at the specific index can be selected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter canSelectCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canSelectCardAtIndex index: Int) -> Bool
    
    /// Asks if the card at the specific index can be unselected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter canUnselectCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canUnselectCardAtIndex index: Int) -> Bool
    
    /// Feedback when the card at the given index will be selected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didSelectedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willSelectCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was selected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didSelectedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didSelectCardAtIndex index: Int)
    
    /// Feedback when the card at the given index will be unselected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didUnselectedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willUnselectCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was unselected.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didUnselectedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didUnselectCardAtIndex index: Int)
    
}
