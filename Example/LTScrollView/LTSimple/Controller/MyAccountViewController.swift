//
//  LTSimpleManagerDemo.swift
//  LTScrollView
//
//  Created by 高刘通 on 2018/2/3.
//  Copyright © 2018年 LT. All rights reserved.
//
private let glt_iphoneX = (UIScreen.main.bounds.height >= 812.0)

import UIKit
import MJRefresh

class MyAccountViewController: UIViewController {
    
    private lazy var titles: [String] = {
        return ["dot0", "dot1", "dot2"]
    }()
    
    private lazy var pageViewControllers: [UIViewController] = {
        var vcs = [UIViewController]()
        for _ in titles {
            vcs.append(PageViewController())
        }
        return vcs
    }()
    
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 4.0
        layout.bottomLineCornerRadius = 2.0
        return layout
    }()
    
    private func managerReact() -> CGRect {
        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        let Y: CGFloat = statusBarH + 44
        let H: CGFloat = glt_iphoneX ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: 0, y: Y, width: view.bounds.width, height: H)
    }
    
    /*
     // 取消注释此处为自定义titleView
     private lazy var simpleManager: LTSimpleManager = {
     let customTitleView = LTCustomTitleView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44), titles: titles, layout: layout)
     customTitleView.isCustomTitleView = true
     let simpleManager = LTSimpleManager(frame: managerReact(), pageViewControllers: pageViewControllers, titles: titles, currentViewController: self, layout: layout, titleView: customTitleView)
     /* 设置代理 监听滚动 */
     simpleManager.delegate = self
     return simpleManager
     }()
     */

    

    private lazy var containerView: KFScrollableContainerView = {
        let simpleManagerView = KFScrollableContainerView(frame: managerReact(),
                                                    viewControllers: pageViewControllers,
                                                    titles: titles,
                                                    currentViewController: self,
                                                    layout: layout)
        simpleManagerView.delegate = self
        return simpleManagerView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(containerView)
        containerViewConfig()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("LTSimpleManagerDemo < --> deinit")
    }
}


extension MyAccountViewController {
    
    private func containerViewConfig() {
        containerView.configHeaderView {[weak self] in
            guard let strongSelf = self else { return nil }
            let headerView = strongSelf.testLabel()
            return headerView
        }
        
        containerView.didSelectIndexHandle { (index) in
            print("page \(index) 😆")
        }
        
    }
    
    @objc private func tapLabel(_ gesture: UITapGestureRecognizer)  {
        print("tapLabel☄")
    }
}

extension MyAccountViewController: KFScrollableContainerViewDelegate {
    
    //MARK: 滚动代理方法
    func glt_scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        print("offset -> ", scrollView.contentOffset.y)
    }
    
    //MARK: 控制器刷新事件代理方法
    func glt_refreshScrollView(_ scrollView: UIScrollView, _ index: Int) {
        //注意这里循环引用问题。
        scrollView.mj_header = MJRefreshNormalHeader {[weak scrollView] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                print("对应控制器的刷新自己玩吧，这里就不做处理了🙂-----\(index)")
                scrollView?.mj_header.endRefreshing()
            })
        }
    }
}

extension MyAccountViewController {
    private func testLabel() -> UILabel {
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180))
        headerView.backgroundColor = UIColor.red
        headerView.text = "header view clicked"
        headerView.textColor = UIColor.white
        headerView.textAlignment = .center
        headerView.isUserInteractionEnabled = true
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:))))
        return headerView
    }
}

