//
//  UserNicknameDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation
import Alamofire

class UserNicknameDataManager {
    
    func patchUserNickname(_ parameters: UserNicknameRequest, delegate: NickNameVC) {
        
        var url: String
        
        if let userIndex = UserDefaults.standard.string(forKey: "userIdx") {
            url = "https://rc1-hardy.shop/users/email-login/\(userIndex)"
        }
        else {
            url = "https://rc1-hardy.shop/users/email-login"
        }
        
        var header : HTTPHeaders = []
        
        if let token = UserDefaults.standard.string(forKey: "userToken") {
            header = ["Content-Type":"application/json", "X-ACCESS-TOKEN": token]
        }
        else {
            header = ["Content-Type":"application/json"]
        }
        
        AF.request(url, method: .patch, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .responseDecodable(of: UserNicknameResponse.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessUserNicknameChange(result: response)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest(message: "오류가났습니다.")
                }
            }
    }
}

