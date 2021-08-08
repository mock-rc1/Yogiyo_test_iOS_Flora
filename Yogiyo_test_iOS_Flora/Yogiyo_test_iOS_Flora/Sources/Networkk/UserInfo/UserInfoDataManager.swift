//
//  UserInfoDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import Foundation
import Alamofire

class UserInfoDataManager {
    static let shared = UserInfoDataManager()
    
    let URL = "https://rc1-hardy.shop/users/email-login/:userIdx"
    
    func getUserInfo(delegate: MyInfoViewController) {
        
        AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json","X-ACCESS-TOKEN": "token"])
            .validate()
            .responseDecodable(of: UserInfo.self) { response in
                switch response.result {
                case .success(let response):
                    delegate.didSuccessUserInfo(result: response.result)
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

