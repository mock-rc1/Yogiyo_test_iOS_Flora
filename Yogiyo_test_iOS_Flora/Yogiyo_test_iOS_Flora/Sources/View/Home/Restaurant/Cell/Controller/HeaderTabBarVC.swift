//
//  HeaderTabBarVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit
import XLPagerTabStrip

class HeaderTabBarVC: ButtonBarPagerTabStripViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // change selected bar color
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white
            settings.style.selectedBarBackgroundColor = .black
            settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 16)
            settings.style.selectedBarHeight = 2.0
            settings.style.buttonBarMinimumLineSpacing = 0
            settings.style.buttonBarItemTitleColor = .black
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0
            
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .systemGray2
            newCell?.label.textColor = .black
            }
        }
        
        override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildVC1")
        let child_2 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildVC2")
        let child_3 = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ChildVC3")
        return [child_1, child_2, child_3]
        }
        

    }
