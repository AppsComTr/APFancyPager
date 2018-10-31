# APFancyPager
A fancy pager view controller framework for Swift/Objective-C

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/88b5da03f40f4b1daf7f14343606a998)](https://app.codacy.com/app/mertsimsek/APFancyPager?utm_source=github.com&utm_medium=referral&utm_content=AppsComTr/APFancyPager&utm_campaign=Badge_Grade_Dashboard)
[![Platform](https://img.shields.io/cocoapods/p/APFancyPager.svg)](https://github.com/AppsComTr/APFancyPager)
[![CocoaPods](https://img.shields.io/cocoapods/v/APFancyPager.svg)](https://cocoapods.org/pods/APFancyPager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/cocoapods/l/APFancyPager.svg)](https://raw.githubusercontent.com/AppsComTr/APFancyPager/master/LICENSE)

## Installation

### Cocoapods
Simply add the APFancyPager to your Podfile:

`pod 'APFancyPager'`

### Carthage
You can use Carthage as well. Paste below line to your Cartfile:
`github "AppsComTr/APFancyPager"`

### Manual
Also, you can copy-paste the Swift files directly into your project.

## Usage

You can check the demo project to get the basics of the framework.

Simply make your view controller extend APFancyPagerViewController and also implement the data source and optionally the delegate.

You should use the below data source function in order to specify the number of pages that APFancyPager will show.
```swift
func numberOfViewControllers(in fancyPagerViewController: APFancyPagerViewController) -> Int {
        return pages.count
}
```

Also you should return your desired header height from the data source function below.

```swift
func heightForHeader(_ fancyPagerViewController: APFancyPagerViewController) -> CGFloat {
        return 100.0
}
```

You should return related view controller into pages by using
```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, viewControllerForIndex index: Int) -> UIViewController
```
Just return your view controller for related index.

You want to show header titles for your fancy pager, don't you? Here, use below data source function o achieve this:
```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerStringForIndex index: Int) -> String
```

For the text color of the header at index this:

```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerTextColorForIndex index: Int) -> UIColor
```

and for the background color at index, this:

```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, headerBackgroundColorForIndex index: Int) -> UIColor
```

There are 2 delegate functions which are
```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, didScrollToIndex index: Int)
```
and
```swift
func fancyPagerViewController(_ fancyPagerViewController: APFancyPagerViewController, isScrollingFromIndex fromIndex: Int, toIndex: Int, progress: CGFloat)
```
You can use them to get some useful (maybe not useful that much) informations about the APFancyPager.

The last but not least, you can use an extra function to scroll the APFancyPager to the any index directly. To achieve this, simply use below function:

```swift
func scrollToPage(_ pageNumber: Int, animated: Bool)
```

## Preview
<img src="https://raw.githubusercontent.com/AppsComTr/APFancyPager/master/docs/appvideo.gif" width="200">

## License
APFancyPager is released under the MIT license. See [LICENSE](https://github.com/AppsComTr/APFancyPager/blob/master/LICENSE) for details.
