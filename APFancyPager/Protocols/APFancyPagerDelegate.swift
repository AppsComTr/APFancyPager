//
//  APFancyPagerDelegate.swift
//  APFancyPager
//
//  Created by Orhun Mert Şimşek on 3.09.2018.
//  Copyright © 2018 Apps. All rights reserved.
//

import UIKit

/// Delegate protocol for APFancyPager
@objc public protocol APFancyPagerDelegate: class {
    /**
     You can implement this function in order to get information
     while the user is scrolling through the APFancyPager.
     - parameter fancyPagerViewController:
     APFancyPagerViewController object of currently using.
     - parameter isScrollingFromIndex: Index parameter that user
     started to scrolling **from** in the APFancyPager.
     - parameter toIndex: Index parameter that user started to
     scrolling **to** in the APFancyPager.
     - parameter progress: Progress of the scrolling.
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  isScrollingFromIndex fromIndex: Int, toIndex: Int, progress: CGFloat)
    
    /**
     You can implement this function in order to get information
     when the user did scroll successfully through the
     APFancyPager.
     - parameter fancyPagerViewController:
     APFancyPagerViewController object of currently using.
     - parameter didScrollToIndex: Index parameter that user
     scrolled in the APFancyPager.
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  didScrollToIndex index: Int)
}

public extension APFancyPagerDelegate {
    public func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                         isScrollingFromIndex fromIndex: Int, toIndex: Int, progress: CGFloat) {
        return
    }
    
    public func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                         didScrollToIndex index: Int) {
        return
    }
}
