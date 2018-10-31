//
//  APFancyPagerDataSource.swift
//  APFancyPager
//
//  Created by Orhun Mert Şimşek on 3.09.2018.
//  Copyright © 2018 Apps. All rights reserved.
//

import UIKit

/// Data source protocol for APFancyPager
@objc public protocol APFancyPagerDataSource: class {
    /**
        You should implement this function in order to tell the number of your view controllers that will be used in the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     
     - returns: Number of view controllers that will be used in the APFancyPager
    */
    func numberOfViewControllers(_ fancyPagerViewController: APFancyPagerViewController) -> Int
    
    /**
     You should implement this function in order to tell the view controllers that will be used in the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     - parameter viewControllerForIndex: Index parameter of the view controller that will be used in the APFancyPager.
     
     - returns: View controller that will be used in the APFancyPager
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, viewControllerForIndex index: Int) -> UIViewController
    
    /**
     You should implement this function in order to tell the header height of the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     
     - returns: Header height of the APFancyPager
     */
    func heightForHeader(_ fancyPagerViewController: APFancyPagerViewController) -> CGFloat
    
    /**
     You should implement this function in order to tell the header string at the given index of the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     - parameter headerStringForIndex: Index parameter of the header that used in the APFancyPager.
     
     - returns: Header string of the given index of the APFancyPager
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerStringForIndex index: Int) -> String
    
    /**
     You should implement this function in order to tell the header background color at the given index of the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     - parameter headerBackgroundColorForIndex: Index parameter of the header that used in the APFancyPager.
     
     - returns: Header background color of the given index of the APFancyPager
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerBackgroundColorForIndex index: Int) -> UIColor
    
    /**
     You should implement this function in order to tell the header text color at the given index of the APFancyPager.
     - parameter fancyPagerViewController: APFancyPagerViewController object of currently using.
     - parameter headerTextColorForIndex: Index parameter of the header that used in the APFancyPager.
     
     - returns: Header text color of the given index of the APFancyPager
     */
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerTextColorForIndex index: Int) -> UIColor
}
