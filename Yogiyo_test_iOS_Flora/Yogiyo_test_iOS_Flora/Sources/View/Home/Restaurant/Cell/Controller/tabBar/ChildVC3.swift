//
//  ChildVC3.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit
import XLPagerTabStrip

class ChildVC3: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "정보")
    }

}
