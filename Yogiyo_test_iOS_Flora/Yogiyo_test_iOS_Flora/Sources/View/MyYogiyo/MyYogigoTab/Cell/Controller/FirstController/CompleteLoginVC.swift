//
//  CompleteLoginVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import UIKit

class CompleteLoginVC: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
}

extension CompleteLoginVC {
    func didSuccessSignUp(_ result: SignUpResult) {
            userNameLabel.text = result.jwt
    }
}
