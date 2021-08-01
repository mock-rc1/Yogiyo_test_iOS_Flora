//
//  SocialLoginViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

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
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
    // 회원가입버튼
    @IBAction func signUpBtnTap(_ sender: Any) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "EmailSignUpViewController") as? EmailSignUpViewController else { return }
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
        
        
        
    }
    
    // 카카오로그인버튼
    @IBAction func kakaoLoginBtnTap(_ sender: Any) {
        
        // 카카오톡 설치 여부
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
        // 시뮬레이터에서 실행
        else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                    // 어세스토큰
                    let accessToken = oauthToken?.accessToken
                }
            }
        }
        
        func setUserInfo() {
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    //do something
                    _ = user
                    
                    
                    if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                       let data = try? Data(contentsOf: url) {
                        
                    }
                }
            }
        }
    }
    
    
    
}


