//
//  FirstVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit
import XLPagerTabStrip

class FirstVC: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var packTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "배달/포장주문")
    }

}
