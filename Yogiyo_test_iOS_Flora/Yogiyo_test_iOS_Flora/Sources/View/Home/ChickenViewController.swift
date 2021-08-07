//
//  ChickenViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit
import XLPagerTabStrip

class ChickenViewController: UIViewController, IndicatorInfoProvider {

        override func viewDidLoad() {
            super.viewDidLoad()

            
        }
        

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "치킨")
        }

    }
