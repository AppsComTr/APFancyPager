//
//  APFancyPagerViewController.swift
//  APFancyPager
//
//  Created by Orhun Mert Şimşek on 31.08.2018.
//  Copyright © 2018 Apps. All rights reserved.
//

import UIKit

/// Our almighty class which is simply a UIViewController.
/// Everything starts by using this view controller.
open class APFancyPagerViewController: UIViewController, UIScrollViewDelegate {
    /// Delegate variable, you don't have to set this.
    open weak var delegate: APFancyPagerDelegate?
    /// Datasource variable, you have to set this.
    open weak var dataSource: APFancyPagerDataSource?
    
    /// Label for header title.
    private let headerTitleLabel = UILabel()
    /// Container scroll view which we later add our view controllers into.
    private let containerScrollView = UIScrollView()
    /// Conatiner view that contains header title and a small
    /// padding for status bar.
    private let headerContainerView = UIView()
    
    /// Total header height.
    private var headerHeight: CGFloat!
    /// Total number of controllers.
    private var numberOfControllers: Int!
    /// This variable used for detection of the scroll direction.
    private var lastPercentage: CGFloat = 0.0
    
    /// Some initialization codes.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Still some initialization codes.
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    /// The viewDidLoad function that we also override from
    /// UIViewController. But you already know that.
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        if dataSource == nil {
            return
        }
        
        initializeViews()
    }
    
    /// Initialization of the views.
    private func initializeViews() {
        reloadData()
        
        headerContainerView.frame = CGRect(x: 0.0,
                                           y: 0.0,
                                           width: view.bounds.width,
                                           height: headerHeight)
        headerContainerView.backgroundColor = dataSource!.fancyPagerViewController(self,
                                                                                   headerBackgroundColorForIndex: 0)
        view.addSubview(headerContainerView)
        
        headerTitleLabel.frame = CGRect(x: 0,
                                        y: Util.statusBarHeight(),
                                        width: headerContainerView.bounds.width,
                                        height: headerContainerView.frame.height - Util.statusBarHeight())
        headerTitleLabel.text = dataSource!.fancyPagerViewController(self, headerStringForIndex: 0)
        headerTitleLabel.textColor = dataSource!.fancyPagerViewController(self, headerTextColorForIndex: 0)
        headerTitleLabel.font = UIFont.systemFont(ofSize: 22.0)
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.minimumScaleFactor = 0.2
        headerTitleLabel.adjustsFontSizeToFitWidth = true
        headerContainerView.addSubview(headerTitleLabel)
        
        containerScrollView.frame = CGRect(x: 0,
                                           y: headerHeight,
                                           width: view.bounds.width,
                                           height: view.bounds.height - headerHeight)
        containerScrollView.contentSize = CGSize(width: containerScrollView.bounds.width * CGFloat(numberOfControllers),
                                                 height: containerScrollView.bounds.height)
        containerScrollView.delegate = self
        containerScrollView.bounces = false
        containerScrollView.isPagingEnabled = true
        view.addSubview(containerScrollView)
        
        addViewControllersToPager()
    }
    
    /// This function adds view controllers to
    /// the **APFancyPager**. Does not take any
    /// parameters, does things by using the
    /// data source which is already provided.
    private func addViewControllersToPager() {
        var xVal: CGFloat = 0.0
        
        for index in 0...numberOfControllers {
            let currentVC = dataSource!.fancyPagerViewController(self, viewControllerForIndex: index)
            
            addChild(currentVC)
            currentVC.view.frame = CGRect(x: xVal,
                                          y: 0.0,
                                          width: containerScrollView.bounds.width,
                                          height: containerScrollView.bounds.height)
            containerScrollView.addSubview(currentVC.view)
            currentVC.willMove(toParent: self)
            
            xVal += containerScrollView.bounds.width
        }
    }
    
    /// Use this function in order to reload the APFancyPager.
    open func reloadData() {
        headerHeight = dataSource!.heightForHeader(self)
        numberOfControllers = dataSource!.numberOfViewControllers(self)
    }
    
    /**
     You can use this function in order to scroll to the specific
     index of the APFancyPager.
     - parameter pageNumber: Page number that you want to scroll
     to. **Friendly reminder:** Sure, you already know that but
     anyways, this number starts with the **0(zero)**.
     - parameter animated: Should this scrolling be animated or not?
     */
    open func scrollToPage(_ pageNumber: Int, animated: Bool) {
        if pageNumber >= 0 && pageNumber < numberOfControllers {
            containerScrollView.scrollRectToVisible(CGRect(x: containerScrollView.bounds.width * CGFloat(pageNumber),
                                                           y: 0.0,
                                                           width: containerScrollView.bounds.width,
                                                           height: containerScrollView.bounds.height),
                                                    animated: animated)
        }
    }
    
    /**
     This great function helps to animate the header title.
     
     - parameter sourceString: Which string is the our start string.
     - parameter destinationString: Which string is the our end string.
     - parameter percentage: Percentage of the progress of the transition.
     
     */
    private func animateHeaderTitle(_ sourceString: String,
                                    _ destinationString: String,
                                    _ percentage: CGFloat) {
        let maxLetterCount = max(sourceString.count, destinationString.count)
        let changingLetterCountTreshold = 1.0 / Double(maxLetterCount)
        let indexOfCharacter = Int(floor(Double(percentage) / changingLetterCountTreshold))
        
        var tempSourceString = sourceString
        var tempDestinationString = destinationString
        
        var newString = ""
        
        if indexOfCharacter >= sourceString.count {
            for _ in 0...(maxLetterCount - sourceString.count) {
                tempSourceString.append(" ")
            }
        } else if indexOfCharacter >= destinationString.count {
            for _ in 0...(maxLetterCount - destinationString.count) {
                tempDestinationString.append(" ")
            }
        }
        
        newString = String(tempSourceString[indexOfCharacter...(tempSourceString.count - 1)])
        if indexOfCharacter != 0 {
            newString += String(tempDestinationString[0...indexOfCharacter - 1])
        }
        
        headerTitleLabel.text = newString
    }
    
    /**
     We use this function to get scroll movements of our scrollview.
     
     - parameter scrollView: UIScrollView that is currently being used.
     
     */
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = floorf(Float(scrollView.contentOffset.x / (scrollView.frame.size.width)))
        let percentageOffset = (scrollView.contentOffset.x / scrollView.frame.width) - CGFloat(pageNumber)
        
        if percentageOffset > 0.0 {
            if numberOfControllers > Int(pageNumber) + 1 {
                if lastPercentage < percentageOffset {
                    delegate?.fancyPagerViewController(self,
                                                       isScrollingFromIndex: Int(pageNumber),
                                                       toIndex: Int(pageNumber + 1),
                                                       progress: percentageOffset)
                } else if lastPercentage > percentageOffset {
                    delegate?.fancyPagerViewController(self,
                                                       isScrollingFromIndex: Int(pageNumber + 1),
                                                       toIndex: Int(pageNumber),
                                                       progress: 1.0 - percentageOffset)
                }
                lastPercentage = percentageOffset
                
                let prevBackgroundColor = dataSource!.fancyPagerViewController(self,
                                                                               headerBackgroundColorForIndex: Int(pageNumber))
                let nextBackgroundColor = dataSource!.fancyPagerViewController(self,
                                                                               headerBackgroundColorForIndex: Int(pageNumber + 1))
                
                let prevTitleColor = dataSource!.fancyPagerViewController(self,
                                                                          headerTextColorForIndex: Int(pageNumber))
                let nextTitleColor = dataSource!.fancyPagerViewController(self,
                                                                          headerTextColorForIndex: Int(pageNumber + 1))
                
                let prevTitleString = dataSource!.fancyPagerViewController(self,
                                                                           headerStringForIndex: Int(pageNumber))
                let nextTitleString = dataSource!.fancyPagerViewController(self,
                                                                           headerStringForIndex: Int(pageNumber + 1))
                
                let headerContainerColorRed = prevBackgroundColor.rgba.red +
                    ((nextBackgroundColor.rgba.red - prevBackgroundColor.rgba.red) * percentageOffset)
                
                let headerContainerColorGreen = prevBackgroundColor.rgba.green +
                    ((nextBackgroundColor.rgba.green - prevBackgroundColor.rgba.green) * percentageOffset)
                
                let headerContainerColorBlue = prevBackgroundColor.rgba.blue +
                    ((nextBackgroundColor.rgba.blue - prevBackgroundColor.rgba.blue) * percentageOffset)
                
                let headerContainerColorAlpha = prevBackgroundColor.rgba.alpha +
                    ((nextBackgroundColor.rgba.alpha - prevBackgroundColor.rgba.alpha) * percentageOffset)
                
                headerContainerView.backgroundColor = UIColor(red: headerContainerColorRed,
                                                              green: headerContainerColorGreen,
                                                              blue: headerContainerColorBlue,
                                                              alpha: headerContainerColorAlpha)
                
                let headerTitleColorRed = prevTitleColor.rgba.red +
                    ((nextTitleColor.rgba.red - prevTitleColor.rgba.red) * percentageOffset)
                
                let headerTitleColorGreen = prevTitleColor.rgba.green +
                    ((nextTitleColor.rgba.green - prevTitleColor.rgba.green) * percentageOffset)
                
                let headerTitleColorBlue = prevTitleColor.rgba.blue +
                    ((nextTitleColor.rgba.blue - prevTitleColor.rgba.blue) * percentageOffset)
                
                let headerTitleColorAlpha = prevTitleColor.rgba.alpha +
                    ((nextTitleColor.rgba.alpha - prevTitleColor.rgba.alpha) * percentageOffset)
                
                headerTitleLabel.textColor = UIColor(red: headerTitleColorRed,
                                                     green: headerTitleColorGreen,
                                                     blue: headerTitleColorBlue,
                                                     alpha: headerTitleColorAlpha)
                
                animateHeaderTitle(prevTitleString, nextTitleString, percentageOffset)
            }
        }
    }
    
    /**
     We use this function also to get scroll movements of our scrollview.
     
     - parameter scrollView: UIScrollView that is currently being used.
     
     */
    open func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let pageNumber = roundf(Float(scrollView.contentOffset.x / (scrollView.frame.size.width)))
        headerContainerView.backgroundColor = dataSource!.fancyPagerViewController(self,
                                                                                   headerBackgroundColorForIndex: Int(pageNumber))
        headerTitleLabel.text = dataSource!.fancyPagerViewController(self,
                                                                     headerStringForIndex: Int(pageNumber))
        
        delegate?.fancyPagerViewController(self, didScrollToIndex: Int(pageNumber))
    }
    
    /**
     We use this function also to get scroll movements of our scrollview.
     
     - parameter scrollView: UIScrollView that is currently being used.
     
     */
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = roundf(Float(scrollView.contentOffset.x / (scrollView.frame.size.width)))
        headerContainerView.backgroundColor = dataSource!.fancyPagerViewController(self,
                                                                                   headerBackgroundColorForIndex: Int(pageNumber))
        headerTitleLabel.text = dataSource!.fancyPagerViewController(self,
                                                                     headerStringForIndex: Int(pageNumber))
        
        delegate?.fancyPagerViewController(self, didScrollToIndex: Int(pageNumber))
    }
}
