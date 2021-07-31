//
//  SocialLoginViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class SocialLoginViewController: UIViewController {

    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var naverLoginBtn: UIButton!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var emailSignUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction
    // 취소버튼
    @IBAction func cancelBtnTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // 이메일로그인버튼
    @IBAction func emailLoginBtnTap(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(identifier: "emailLoginViewController") as? emailLoginViewController else {return}
        
//        navigationController?.pushViewController(dvc, animated: true)
        self.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
        
        
    }
}


