//
//  SplashViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func nextPageBtnTap(_ sender: Any) {
        let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        changeRootViewController(mainTabBarController)
    }
    
}
