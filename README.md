# HFCardCollectionViewLayout
The HFCardCollectionViewLayout provides a card stack layout not quite similar like the apps Reminder and Wallet.

Features:

- Many options, also within the InterfaceBuilder
- Flip animation to have a backview
- Move/Order the cards
- Simple integration (only set the Layout class in the CollectionView)

![Screenshot](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/Screenshot.png)
![Screenplay](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/Screenplay.gif)


## Installation

Install it with Cocoapods, Swift Package Manager, Carthage  or just use the files inside the **Source** directory.


**Cocoapods:**
```
pod 'HFCardCollectionViewLayout'
```


**Carthage:**
```
github "hfrahmann/HFCardCollectionViewLayout"
```


**Swift Package Manager:**
```
dependencies: [
    .Package(url: "https://github.com/hfrahmann/HFCardCollectionViewLayout.git")
]
```



## Implementation

Just set *HFCardCollectionViewLayout* as the custom layout class in your UICollectionView.

![CollectionView_LayoutClass](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CollectionView_LayoutClass.png)


There is also a cell class called **HFCardCollectionViewCell** containing rounded corners and a shadow.
But this class has no dependency on the *HFCardCollectionViewLayout*.
It's only there to have a cell that looks like a card.

**Important: This collectionView layout does support only one section!**


### HFCardCollectionView

Because of some problems with inserting items while a card is revealed, you have to use the **HFCardCollectionView** instead of the UICollectionView.
Or if you use your own collectionview class, you can copy the lines from the file to your own.


## Delegate

These are the delegate functions of the **HFCardCollectionViewLayoutDelegate** inherits from *UICollectionViewDelete* so you don't need to connect a further delegate.

```swift
/// Asks if the card at the specific index can be revealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter canRevealCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canRevealCardAtIndex index: Int) -> Bool

/// Asks if the card at the specific index can be unrevealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter canUnrevealCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, canUnrevealCardAtIndex index: Int) -> Bool

/// Feedback when the card at the given index will be revealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didRevealedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willRevealCardAtIndex index: Int)
    
/// Feedback when the card at the given index was revealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didRevealedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didRevealCardAtIndex index: Int)
    
/// Feedback when the card at the given index will be unrevealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didUnrevealedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, willUnrevealCardAtIndex index: Int)

/// Feedback when the card at the given index was unrevealed.
/// - Parameter collectionViewLayout: The current HFCardCollectionViewLayout.
/// - Parameter didUnrevealedCardAtIndex: Index of the card.
func cardCollectionViewLayout(_ collectionViewLayout: HFCardCollectionViewLayout, didUnrevealCardAtIndex index: Int)
```



## Options and Actions

You also have access to the options and (some) actions at the *HFCardCollectionViewLayout* object in the interface builder.

![CardLayoutOptions2](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CardLayoutOptions.png)
![CardLayoutActions](https://raw.githubusercontent.com/hfrahmann/HFCardCollectionViewLayout/master/ReadmeAssets/CardLayoutActions.png)

These are the public variables of *HFCardCollectionViewLayout*.

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

/// Count of bottom stacked cards when a card is revealed.
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

/// Cards are stopping at top while scrolling.
@IBInspectable var scrollStopCardsAtTop: Bool = true

/// All cards are collapsed at bottom.
@IBInspectable var collapseAllCards: Bool = false
    
/// Contains the revealed index.
/// ReadOnly.
private(set) var revealedIndex: Int = -1
```

Interface builder actions
```swift
/////////////// InterfaceBuilder Actions


/// Action for the InterfaceBuilder to flip back the revealed card.
@IBAction func flipBackRevealedCardAction()

/// Action for the InterfaceBuilder to unreveal the revealed card.
@IBAction func unrevealRevealedCardAction()

/// Action to collapse all cards.
@IBAction func collapseAllCardsAction()
```

Public functions
```swift
/////////////// Public Functions


/// Reveal a card at the given index.
///
/// - Parameter index: The index of the card.
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func revealCardAt(index: Int, completion: (() -> Void)? = nil)

/// Unreveal the revealed card
///
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func unrevealCard(completion: (() -> Void)? = nil)


/// Flips the revealed card to the given view.
/// The frame for the view will be the same as the cell
///
/// - Parameter toView: The view for the backview of te card.
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func flipRevealedCard(toView: UIView, completion: (() -> Void)? = nil)


/// Flips the flipped card back to the frontview.
///
/// - Parameter completion: An optional completion block. Will be executed the animation is finished.
public func flipRevealedCardBack(completion: (() -> Void)? = nil)
```


## License

MIT License
