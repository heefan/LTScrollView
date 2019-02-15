//
//  KFScrollableContainerViewDelegate.swift
//  LTScrollView_Example
//
//  Created by litian on 15/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

public protocol KFScrollableContainerViewDelegate: class {
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView)
    func glt_scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    func glt_scrollViewWillBeginDecelerating(_ scrollView: UIScrollView)
    func glt_scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    func glt_scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    func glt_scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int);
}

extension KFScrollableContainerViewDelegate {
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView) {}
    func glt_scrollViewWillBeginDragging(_ scrollView: UIScrollView) {}
    func glt_scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {}
    func glt_scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {}
    func glt_scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {}
    func glt_scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {}
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {}
}
