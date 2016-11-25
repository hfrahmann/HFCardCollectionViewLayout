//
//  MenuTableViewController.swift
//  HFCardCollectionViewLayoutExample
//
//  Created by Hendrik Frahmann on 31.10.16.
//  Copyright © 2016 Hendrik Frahmann. All rights reserved.
//

import UIKit

struct CardLayoutSetupOptions {
    var firstMovableIndex: Int = 0
    var cardHeadHeight: CGFloat = 80
    var cardShouldExpandHeadHeight: Bool = true
    var cardShouldStretchAtScrollTop: Bool = true
    var cardMaximumHeight: CGFloat = 0
    var bottomNumberOfStackedCards: Int = 5
    var bottomStackedCardsShouldScale: Bool = true
    var bottomCardLookoutMargin: CGFloat = 10
    var bottomStackedCardsMaximumScale: CGFloat = 1.0
    var bottomStackedCardsMinimumScale: CGFloat = 0.94
    var spaceAtTopForBackgroundView: CGFloat = 0
    var spaceAtTopShouldSnap: Bool = true
    var spaceAtBottom: CGFloat = 0
    var scrollAreaTop: CGFloat = 120
    var scrollAreaBottom: CGFloat = 120
    var scrollShouldSnapCardHead: Bool = false
    var scrollStopCardsAtTop: Bool = true
    
    var numberOfCards: Int = 15
}

class MenuTableViewController: UITableViewController {
    
    var hideNavigationBar = false
    var hideToolBar = false
    
    var defaults = CardLayoutSetupOptions()
    var numberFormatter = NumberFormatter()
    
    @IBOutlet var textfieldNumberOfCards: UITextField?
    @IBOutlet var textfieldFirstMovableIndex: UITextField?
    @IBOutlet var textfieldCardHeadHeight: UITextField?
    @IBOutlet var switchCardShouldExpandHeadHeight: UISwitch?
    @IBOutlet var switchCardShouldStretchAtScrollTop: UISwitch?
    @IBOutlet var textfieldCardMaximumHeight: UITextField?
    @IBOutlet var textfieldBottomNumberOfStackedCards: UITextField?
    @IBOutlet var switchBottomStackedCardsShouldScale: UISwitch?
    @IBOutlet var textfieldBottomCardLookoutMargin: UITextField?
    @IBOutlet var textfieldSpaceAtTopForBackgroundView: UITextField?
    @IBOutlet var textfieldBottomStackedCardsMinimumScale: UITextField?
    @IBOutlet var textfieldBottomStackedCardsMaximumScale: UITextField?
    @IBOutlet var switchSpaceAtTopShouldSnap: UISwitch?
    @IBOutlet var textfieldSpaceAtBottom: UITextField?
    @IBOutlet var textfieldScrollAreaTop: UITextField?
    @IBOutlet var textfieldScrollAreaBottom: UITextField?
    @IBOutlet var switchScrollShouldSnapCardHead: UISwitch?
    @IBOutlet var switchScrollStopCardsAtTop: UISwitch?
    
    override func viewDidLoad() {
        self.numberFormatter.locale = Locale(identifier: "en_US")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.isToolbarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.keyWindow?.endEditing(true)
        self.navigationController?.isNavigationBarHidden = self.hideNavigationBar
        self.navigationController?.isToolbarHidden = self.hideToolBar
    }
    
    // MARK: Actions
    
    @IBAction func resetAction() {
        self.textfieldNumberOfCards?.text                   = String(self.defaults.numberOfCards)
        self.textfieldFirstMovableIndex?.text               = String(self.defaults.firstMovableIndex)
        self.textfieldCardHeadHeight?.text                  = self.stringFromFloat(self.defaults.cardHeadHeight)
        self.switchCardShouldExpandHeadHeight?.isOn         = self.defaults.cardShouldExpandHeadHeight
        self.switchCardShouldStretchAtScrollTop?.isOn       = self.defaults.cardShouldStretchAtScrollTop
        self.textfieldCardMaximumHeight?.text               = self.stringFromFloat(self.defaults.cardMaximumHeight)
        self.textfieldBottomNumberOfStackedCards?.text      = String(self.defaults.bottomNumberOfStackedCards)
        self.switchBottomStackedCardsShouldScale?.isOn      = self.defaults.bottomStackedCardsShouldScale
        self.textfieldBottomCardLookoutMargin?.text         = self.stringFromFloat(self.defaults.bottomCardLookoutMargin)
        self.textfieldSpaceAtTopForBackgroundView?.text     = self.stringFromFloat(self.defaults.spaceAtTopForBackgroundView)
        self.switchSpaceAtTopShouldSnap?.isOn               = self.defaults.spaceAtTopShouldSnap
        self.textfieldSpaceAtBottom?.text                   = self.stringFromFloat(self.defaults.spaceAtBottom)
        self.textfieldScrollAreaTop?.text                   = self.stringFromFloat(self.defaults.scrollAreaTop)
        self.textfieldScrollAreaBottom?.text                = self.stringFromFloat(self.defaults.scrollAreaBottom)
        self.switchScrollShouldSnapCardHead?.isOn           = self.defaults.scrollShouldSnapCardHead
        self.switchScrollStopCardsAtTop?.isOn               = self.defaults.scrollStopCardsAtTop
        self.textfieldBottomStackedCardsMinimumScale?.text  = self.stringFromFloat(self.defaults.bottomStackedCardsMinimumScale)
        self.textfieldBottomStackedCardsMaximumScale?.text  = self.stringFromFloat(self.defaults.bottomStackedCardsMaximumScale)
    }
    
    // MARK: Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ExampleViewController {
            
            var layoutOptions = CardLayoutSetupOptions()
            layoutOptions.numberOfCards                 = self.getIntFromTextfield(self.textfieldNumberOfCards!)
            layoutOptions.firstMovableIndex             = self.getIntFromTextfield(self.textfieldFirstMovableIndex!)
            layoutOptions.cardHeadHeight                = self.getFloatFromTextfield(self.textfieldCardHeadHeight!)
            layoutOptions.cardShouldExpandHeadHeight    = self.switchCardShouldExpandHeadHeight!.isOn
            layoutOptions.cardShouldStretchAtScrollTop  = self.switchCardShouldStretchAtScrollTop!.isOn
            layoutOptions.cardMaximumHeight             = self.getFloatFromTextfield(self.textfieldCardMaximumHeight!)
            layoutOptions.bottomNumberOfStackedCards    = self.getIntFromTextfield(self.textfieldBottomNumberOfStackedCards!)
            layoutOptions.bottomStackedCardsShouldScale = self.switchBottomStackedCardsShouldScale!.isOn
            layoutOptions.bottomCardLookoutMargin       = self.getFloatFromTextfield(self.textfieldBottomCardLookoutMargin!)
            layoutOptions.spaceAtTopForBackgroundView   = self.getFloatFromTextfield(self.textfieldSpaceAtTopForBackgroundView!)
            layoutOptions.spaceAtTopShouldSnap          = self.switchSpaceAtTopShouldSnap!.isOn
            layoutOptions.spaceAtBottom                 = self.getFloatFromTextfield(self.textfieldSpaceAtBottom!)
            layoutOptions.scrollAreaTop                 = self.getFloatFromTextfield(self.textfieldScrollAreaTop!)
            layoutOptions.scrollAreaBottom              = self.getFloatFromTextfield(self.textfieldScrollAreaBottom!)
            layoutOptions.scrollShouldSnapCardHead      = self.switchScrollShouldSnapCardHead!.isOn
            layoutOptions.scrollStopCardsAtTop          = self.switchScrollStopCardsAtTop!.isOn
            layoutOptions.bottomStackedCardsMinimumScale = self.getFloatFromTextfield(self.textfieldBottomStackedCardsMinimumScale!)
            layoutOptions.bottomStackedCardsMaximumScale = self.getFloatFromTextfield(self.textfieldBottomStackedCardsMaximumScale!)
            
            controller.cardLayoutOptions = layoutOptions
            
            if(segue.identifier == "AsRootController") {
                self.hideNavigationBar = true
                self.hideToolBar = true
                controller.shouldSetupBackgroundView = true
            }
            if(segue.identifier == "WithinNavigationController") {
                self.hideNavigationBar = false
                self.hideToolBar = true
            }
            if(segue.identifier == "WithNavigationAndToolbar") {
                self.hideNavigationBar = false
                self.hideToolBar = false
            }
        }
    }
    
    // MARK: Private functions
    
    private func getIntFromTextfield(_ textfield: UITextField) -> Int {
        if let n = self.numberFormatter.number(from: (textfield.text)!) {
            return n.intValue
        }
        return 0
    }
    
    private func getFloatFromTextfield(_ textfield: UITextField) -> CGFloat {
        if let n = self.numberFormatter.number(from: (textfield.text)!) {
            return CGFloat(n)
        }
        return 0
    }
    
    private func stringFromFloat(_ float: CGFloat) -> String {
        return String(Int(float))
    }
    
}
