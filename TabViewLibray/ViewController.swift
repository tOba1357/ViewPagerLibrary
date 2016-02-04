//

//  ViewController.swift
//  TabViewLibray
//
//  Created by Tatsuya Oba on 2016/02/04.
//  Copyright © 2016年 Tatsuya Oba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let views = [makeViewPagerElement(UIColor.blackColor()), makeViewPagerElement(UIColor.redColor()), makeViewPagerElement(UIColor.greenColor())]
        let tabView = ViewPager(frame: self.view.frame, tabHeigh: 100, views: views)
        self.view.addSubview(tabView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeViewPagerElement(color: UIColor) -> ViewPagerElement{
        let selectedTitleView = UIView()
        let selectedButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        selectedButton.setTitle("Hello!", forState: UIControlState.Normal)
        selectedTitleView.addSubview(selectedButton)
        selectedTitleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        selectedTitleView.backgroundColor = UIColor.whiteColor()
        
        let noSelectedTitleView = UIView()
        let noSelectedButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        noSelectedButton.setTitle("Hello!", forState: UIControlState.Normal)
        noSelectedTitleView.addSubview(noSelectedButton)
        noSelectedTitleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        noSelectedTitleView.backgroundColor = color
        
        let mainView = UIScrollView()
        mainView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 100)
        mainView.backgroundColor = color
        mainView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.text = "Hello!"
        label.textColor = UIColor.whiteColor()
        mainView.addSubview(label)
        
        return ViewPagerElement(
            selectedTitleView: selectedTitleView,
            noSelectedTitleView: noSelectedTitleView,
            mainView: mainView
        )
    }
}

