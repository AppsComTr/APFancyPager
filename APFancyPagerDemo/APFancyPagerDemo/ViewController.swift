//
//  ViewController.swift
//  APFancyPagerDemo
//
//  Created by Orhun Mert Şimşek on 31.08.2018.
//  Copyright © 2018 Apps. All rights reserved.
//

import APFancyPager
import UIKit

class ViewController: APFancyPagerViewController, APFancyPagerDelegate, APFancyPagerDataSource {
    override func viewDidLoad() {
        self.dataSource = self
        self.delegate = self
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func numberOfViewControllers(in fancyPagerViewController: APFancyPagerViewController) -> Int {
        return 4
    }
    
    func heightForHeader(_ fancyPagerViewController: APFancyPagerViewController) -> CGFloat {
        return 100.0
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  viewControllerForIndex index: Int) -> UIViewController {
        let viewController = UIViewController()
        let button = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        button.center = viewController.view.center
        if index == 0 {
            button.backgroundColor = UIColor.blue
            button.tag = 1
        } else if index == 1 {
            button.backgroundColor = UIColor.red
            button.tag = 2
        } else if index == 2 {
            button.backgroundColor = UIColor.green
            button.tag = 3
        } else if index == 3 {
            button.backgroundColor = UIColor.orange
            button.tag = 0
        }
        button.addTarget(self, action: #selector(self.buttonClicked(_:)), for: .touchUpInside)
        viewController.view.addSubview(button)
        return viewController
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  headerStringForIndex index: Int) -> String {
        switch index {
        case 0:
            return "Wow really?"
        case 1:
            return "What a great feature"
        case 2:
            return "Best pager. EVER."
        case 3:
            return "YES"
        default:
            return ""
        }
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  headerTextColorForIndex index: Int) -> UIColor {
        switch index {
        case 0:
            return UIColor.orange
        case 1:
            return UIColor.white
        case 2:
            return UIColor.black
        case 3:
            return UIColor.green
        default:
            return UIColor.white
        }
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  headerBackgroundColorForIndex index: Int) -> UIColor {
        switch index {
        case 0:
            return UIColor.blue
        case 1:
            return UIColor.red
        case 2:
            return UIColor.green
        case 3:
            return UIColor.orange
        default:
            return UIColor.black
        }
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  didScrollToIndex index: Int) {
        print("DidScroll: \(index)")
    }
    
    func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController,
                                  isScrollingFromIndex fromIndex: Int, toIndex: Int, progress: CGFloat) {
        print("IsScrolling: \(fromIndex) to: \(toIndex) WithProgress: \(progress)")
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        scrollToPage(sender.tag, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
