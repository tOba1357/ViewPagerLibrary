//
//  ViewPagerTab.swift
//  TabViewLibray
//
//  Created by Tatsuya Oba on 2016/02/05.
//  Copyright © 2016年 Tatsuya Oba. All rights reserved.
//

import UIKit

public protocol ViewPagerTabDelegate: NSObjectProtocol {
    func onClickTabButton(index: Int)
}

class ViewPagerTab :UIView {
    private var views: [ViewPagerElement]!
    private var selectedIndex: Int!
    private var viewNum:Int!
    private var delegate: ViewPagerTabDelegate!
    
    init(delegate: ViewPagerTabDelegate ,frame: CGRect, views: [ViewPagerElement], defalutIndex:Int = 0) {
        super.init(frame: frame)
        self.delegate = delegate
        self.views = views
        self.viewNum = views.count
        self.selectedIndex = defalutIndex
        self.addTitleTab()
    }
    
    private func addTitleTab() {
        views.enumerate().forEach {
            let titleView = (selectedIndex != $0.0) ? $0.1.noSelectedTitleView : $0.1.selectedTitleView
            titleView.frame = CGRect(
                x: 0,
                y: 0,
                width: self.frame.width / CGFloat(viewNum),
                height: self.frame.height
            )
            
            let titleTagButton = UIButton(frame: CGRect(
                x: self.frame.width / CGFloat(viewNum) * CGFloat($0.0),
                y: 0,
                width: self.frame.width / CGFloat(viewNum),
                height: titleView.frame.height
            ))
            titleTagButton.tag = $0.0
            titleTagButton.addTarget(self, action: Selector("onClickTab:"), forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(titleTagButton)
            
            titleTagButton.addSubview(titleView)
        }
    }
    
    func changeSelectedIndex(index: Int) {
        self.selectedIndex = index
        removeAllSubviews(self)
        addTitleTab()
    }
    
    func removeAllSubviews(parentView: UIView){
        for subview in parentView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        for subview in self.subviews.reverse() {
            if subview.pointInside(self.convertPoint(point, toView: subview), withEvent: event) {
                return subview
            }
        }
        return nil
    }
    
    func onClickTab(button :UIButton) {
        self.delegate.onClickTabButton(button.tag)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
