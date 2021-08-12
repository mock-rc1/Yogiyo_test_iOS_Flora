//
//  SignInDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import Foundation
import Alamofire

struct SignInDataManager {
    static let shared = SignInDataManager()
    
    let URL = "https://rc1-hardy.shop/users/email-login"
    
    func postSignIn(_ parameters: SignInRequest, delegate: emailLoginViewController) {
        AF.request(URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: SignInResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessSignIn(result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2015: delegate.failedToRequest(message: "이메일을 입력해주세요.")
                        case 2016: delegate.failedToRequest(message: "이메일 형식을 확인해주세요.")
                        case 2018: delegate.failedToRequest(message: "이메일 길이는 45자 이하여야 합니다.")
                        case 2019: delegate.failedToRequest(message: "비밀번호를 입력해주세요.")
                        case 2020: delegate.failedToRequest(message: "영문/숫자/특수문자 중 2가지 이상을 조합한 8~20자 비밀번호로 입력해주세요.")
                        default: delegate.failedToRequest(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print("에러났다",error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}
