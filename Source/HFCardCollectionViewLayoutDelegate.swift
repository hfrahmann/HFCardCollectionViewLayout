//
//  HFCardCollectionViewLayoutDelegate.swift
//  Pods
//
//  Created by Hendrik Frahmann on 17.11.16.
//
//

import UIKit

/// Extended delegate.
@objc public protocol HFCardCollectionViewLayoutDelegate : UICollectionViewDelegate {
    
    /// Asks if the card at the specific index can be revealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter canRevealCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canRevealCardAtIndex index: Int) -> Bool
    
    /// Asks if the card at the specific index can be Unrevealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter canUnrevealCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canUnrevealCardAtIndex index: Int) -> Bool
    
    /// Feedback when the card at the given index will be revealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didRevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willRevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was revealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didRevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didRevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index will be Unrevealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didUnrevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willUnrevealCardAtIndex index: Int)
    
    /// Feedback when the card at the given index was Unrevealed.
    /// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
    /// - Parameter didUnrevealedCardAtIndex: Index of the card.
    @objc optional func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didUnrevealCardAtIndex index: Int)
    
}
