//
//  TransitionViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit

class TransitionViewController: BaseViewController {
    
    // MARK: RootViewController로 이동
    @IBAction func changeRootViewControllerButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
