# HFCardCollectionViewLayout
The HFCardCollectionViewLayout provides a card stack layout not quite similar like the apps Reminder and Wallet.

![Screenshot](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/Screenshot.png)
![Screenplay](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/Screenplay.gif)


# Installation

Install it with cocoapods or just use the files inside the *Source* directory.

```
pod "HFCardCollectionViewLayout"
```


# Implementation

Just set *HFCardCollectionViewLayout* as the custom layout class.

![CollectionView_LayoutClass](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CollectionView_LayoutClass.png)

There is also a cell class called **HFCardCollectionViewCell** containing rounded corners and a shadow.
But this Cell has no dependency on the *HFCardCollectionViewLayout*.
That means you can use your own *UICollectionViewCell*

**Important: This collectionView layout does support only one section!**

## Delegate

These are the delegate functions of the **HFCardCollectionViewLayoutDelegate** to control the card selection.
The *HFCardCollectionViewLayoutDelegate* inherits from *UICollectionViewDelete*.

```swift
/// Asks if the card at the specific index can be selected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter canSelectCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canSelectCardAtIndex index: Int) -> Bool

/// Asks if the card at the specific index can be unselected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter canUnselectCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canUnselectCardAtIndex index: Int) -> Bool

/// Feedback when the card at the given index will be selected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didSelectedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willSelectCardAtIndex index: Int)
    
/// Feedback when the card at the given index was selected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didSelectedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didSelectCardAtIndex index: Int)
    
/// Feedback when the card at the given index will be unselected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didUnselectedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willUnselectCardAtIndex index: Int)

/// Feedback when the card at the given index was unselected.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didUnselectedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didUnselectCardAtIndex index: Int)
```



## Options and Actions

You also have access to the options and (some) actions at the *HFCardCollectionViewLayout* object in the interface builder.

![CardLayoutOptions2](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CardLayoutOptions2.png)
![CardLayoutActions](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CardLayoutActions.png)

These are the public variables and functions of *HFCardCollectionViewLayout*.

```swift
/////////////// Public Variables

/// Only cards with index equal or greater than firstMovableIndex can be moved through the collectionView.
@IBInspectable var firstMovableIndex: Int = 0

/// Specifies the height that is showing the cardhead when the collectionView is showing all cards.
/// The minimum value is 20.
@IBInspectable var cardHeadHeight: CGFloat = 80

/// When th collectionView is showing all cards but there are not enough cards to fill the full height,
/// the cardHeadHeight will be expanded to equally fill the height.
@IBInspectable var cardShouldExpandHeadHeight: Bool = true

/// Stretch the cards when scrolling up
@IBInspectable var cardShouldStretchAtScrollTop: Bool = true

/// Specifies the maximum height of the cards.
/// But the height can be less if the frame size of collectionView is smaller.
@IBInspectable var cardMaximumHeight: CGFloat = 0

/// Count of bottom stacked cards when a card is selected.
/// Value must be between 0 and 10
@IBInspectable var bottomNumberOfStackedCards: Int = 5

/// All bottom stacked cards are scaled to produce the 3D effect.
@IBInspectable var bottomStackedCardsShouldScale: Bool = true

/// Specifies the margin for the top margin of a bottom stacked card.
/// Value can be between 0 and 20
@IBInspectable var bottomCardLookoutMargin: CGFloat = 10

/// An additional topspace to show the top of the collectionViews backgroundView.
@IBInspectable var spaceAtTopForBackgroundView: CGFloat = 0

/// Snaps the scrollView if the contentOffset is on the 'spaceAtTopForBackgroundView'
@IBInspectable var spaceAtTopShouldSnap: Bool = true

/// Additional space at the bottom to expand the contentsize of the collectionView.
@IBInspectable var spaceAtBottom: CGFloat = 0

/// Area the top where to autoscroll while moving a card.
@IBInspectable var scrollAreaTop: CGFloat = 120

/// Area ot the bottom where to autoscroll while moving a card.
@IBInspectable var scrollAreaBottom: CGFloat = 120

/// The scrollView should snap the cardhead to the top.
@IBInspectable var scrollShouldSnapCardHead: Bool = false

/// Contains the selected index.
/// ReadOnly.
private(set) var selectedIndex: Int = -1


/////////////// InterfaceBuilder Actions


/// Action for the InterfaceBuilder to flip back the selected card.
@IBAction func flipBackSelectedCardAction()

/// Action for the InterfaceBuilder to unselect the selected card.
@IBAction func unselectSelectedCardAction()


/////////////// Public Functions


/// Select a card at the given index.
///
/// - Parameter index: The index of the card.
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func selectCardAt(index: Int, completion: (() -> Void)? = nil)

/// Unselect the selected card
///
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func unselectCard(completion: (() -> Void)? = nil)


/// Flips the selected card to the given view.
/// The frame for the view will be the same as the cell
///
/// - Parameter toView: The view for the backview of te card.
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func flipSelectedCard(toView: UIView, completion: (() -> Void)? = nil)


/// Flips the flipped card back to the frontview.
///
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func flipSelectedCardBack(completion: (() -> Void)? = nil)
```


# License

MIT License
