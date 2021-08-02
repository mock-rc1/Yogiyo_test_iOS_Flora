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
import NaverThirdPartyLogin
import FBSDKLoginKit
import Alamofire

class SocialLoginViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var naverLoginBtn: UIButton!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var emailSignUpBtn: UIButton!
    
    // 네이버
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네이버
        loginInstance?.delegate = self
        
        // 페이스북 버튼
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        // Facebook 로그인 버튼의 읽기 권한 (권한요청)
         loginButton.permissions = ["public_profile", "email"]
        
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
                    
                    // 로그인 성공시
                    guard let dvc = self.storyboard?.instantiateViewController(identifier: "MyYogiyoViewController") as? MyYogiyoViewController else {return}
                    self.navigationController?.pushViewController(dvc, animated: true)
                    
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success.")
                            
                            _ = user
                            // 데이터가져오는거테스트
                            userMainData.shared.loginUser = user?.kakaoAccount?.profile?.nickname
                            //if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                            //  let data = try? Data(contentsOf: url) {
                            //}
                        }
                    }
                }
            }
        }
    }
    
    
    // 네이버
    // 로그인에 성공한 경우 호출
        func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
            print("Success login")
            getInfo()
        }
    
        // referesh token
        func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
            loginInstance?.accessToken
        }
    
        // 로그아웃
        func oauth20ConnectionDidFinishDeleteToken() {
            print("log out")
        }
    
        // 모든 error
        func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
            print("error = \(error.localizedDescription)")
        }
    
        // RESTful API, id가져오기
           func getInfo() {
             guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
    
             if !isValidAccessToken {
               return
             }
    
             guard let tokenType = loginInstance?.tokenType else { return }
             guard let accessToken = loginInstance?.accessToken else { return }
    
             let urlStr = "https://openapi.naver.com/v1/nid/me"
             let url = URL(string: urlStr)!
    
             let authorization = "\(tokenType) \(accessToken)"
    
             let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
    
             req.responseJSON { response in
               guard let result = response.value as? [String: Any] else { return }
               guard let object = result["response"] as? [String: Any] else { return }
               guard let name = object["name"] as? String else { return }
               guard let email = object["email"] as? String else { return }
               guard let id = object["id"] as? String else {return}
    
               print(email)
    
//               self.nameLabel.text =. "\(name)"
//               self.emailLabel.text = "\(email)"
//               self.id.text = "\(id)"
                
                
             }
           }
    
    @IBAction func naverLoginBtnTap(_ sender: Any) {
        
        loginInstance?.requestThirdPartyLogin()
        
        
        // 로그아웃 이렇게 하삼
        // loginInstance?.requestDeleteToken()
        
    }
    
    @IBAction func facebookBtnTap(_ sender: Any) {
        
        // 페이스북 현재 로그인 상태 확인
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            
            
            
            // 로그인 성공시
            guard let dvc = self.storyboard?.instantiateViewController(identifier: "MyYogiyoViewController") as? MyYogiyoViewController else {return}
            self.navigationController?.pushViewController(dvc, animated: true)
            
            
        }
        
    }
    
}


