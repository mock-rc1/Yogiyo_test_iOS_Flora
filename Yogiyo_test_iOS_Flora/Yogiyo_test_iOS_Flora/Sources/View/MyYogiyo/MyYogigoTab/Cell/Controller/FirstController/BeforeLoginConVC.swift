//
//  BeforeLoginConVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import UIKit

class BeforeLoginConVC: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderStyle()

    }
    
    func borderStyle() {
        signUpBtn.layer.borderColor = UIColor.black.cgColor
        signUpBtn.layer.borderWidth = 0.3
    }
    
    // 로그인버튼
    @IBAction func loginBtnTap(_ sender: UIButton) {

        let storyboardVC = UIStoryboard(name: "MyYogiyoStoryboard", bundle: Bundle(for: NavigationViewController.self)).instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
        
        storyboardVC.modalPresentationStyle = .fullScreen
        self.present(storyboardVC, animated: true, completion: nil)

    }
    
    // 회원가입 버튼
    @IBAction func signUpBtnTap(_ sender: UIButton) {

        let storyboardVC = UIStoryboard(name: "MyYogiyoStoryboard", bundle: Bundle(for: EmailSignUpViewController.self)).instantiateViewController(withIdentifier: "EmailSignUpViewController") as! EmailSignUpViewController
        
        storyboardVC.modalPresentationStyle = .fullScreen
        self.present(storyboardVC, animated: true, completion: nil)

    }

}
