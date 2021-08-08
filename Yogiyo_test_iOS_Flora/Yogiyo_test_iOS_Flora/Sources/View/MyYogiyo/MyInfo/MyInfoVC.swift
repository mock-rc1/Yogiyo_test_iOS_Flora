//
//  MyInfoVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class MyInfoVC: UIViewController {

    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailIdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        changeBtn.layer.borderWidth = 0.5
        changeBtn.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }


}
