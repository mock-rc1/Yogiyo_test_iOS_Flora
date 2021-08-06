//
//  SignUpDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import Foundation
import Alamofire

struct SignUpDataManager {
    // 싱글톤 인스턴스 생성 (여러 뷰컨에서 shared로 접근하면 같은 인스턴스에 접근 가능)
    static let shared = SignUpDataManager()
    // 회원가입 URL
    let URL = "https://rc1-hardy.shop/users"
    
    func postSignUp(_ parameters: SignUpRequest, delegate: EmailSignUpViewController) {
        AF.request(URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: SignUpData.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessSignUp(result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2015: delegate.failedToRequest(message: "이메일을 입력해주세요.")
                        case 2016: delegate.failedToRequest(message: "이메일 형식을 확인해주세요.")
                        case 2018: delegate.failedToRequest(message: "이메일 길이는 45자 이하여야 합니다.")
                        case 2019: delegate.failedToRequest(message: "비밀번호를 입력해주세요.")
                        case 2020: delegate.failedToRequest(message: "영문/숫자/특수문자 중 2가지 이상을 조합한 8~20자 비밀번호로 입력해주세요.")
                        case 2021: delegate.failedToRequest(message: "닉네임은 45자 이하여야합니다.")
                        case 2022: delegate.failedToRequest(message: "이용약관에 동의하셔야 합니다.")
                        case 2023: delegate.failedToRequest(message: "개인정보 수집 및 이용 동의를 하셔야 합니다.")
                        case 2024: delegate.failedToRequest(message: "전자금융거래 이용약관에 동의하셔야 합니다.")
                        case 2025: delegate.failedToRequest(message: "만 14세 이상 이용자만 가입이 가능합니다.")
                        default: delegate.failedToRequest(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
            }
        }
    }
}
