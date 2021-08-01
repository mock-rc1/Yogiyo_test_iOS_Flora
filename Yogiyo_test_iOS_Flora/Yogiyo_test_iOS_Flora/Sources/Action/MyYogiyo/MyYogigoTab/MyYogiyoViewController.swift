//
//  MyYogiyoViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class MyYogiyoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginBtnTap(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") as? NavigationViewController else { return }
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
}
