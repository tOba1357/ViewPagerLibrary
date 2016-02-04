//
//  ViewPagerElement.swift
//  TabViewLibray
//
//  Created by Tatsuya Oba on 2016/02/04.
//  Copyright © 2016年 Tatsuya Oba. All rights reserved.
//

import UIKit

class ViewPagerElement {
    var selectedTitleView: UIView
    var noSelectedTitleView: UIView
    var mainView :UIView
    
    init(selectedTitleView:UIView, noSelectedTitleView: UIView, mainView: UIView) {
        self.selectedTitleView = selectedTitleView
        self.noSelectedTitleView = noSelectedTitleView
        self.mainView = mainView
    }
}