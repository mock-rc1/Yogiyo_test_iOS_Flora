//
//  CategoriesDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import Foundation
import Alamofire

class CategoriesDataManager {
    
    func getCategories(delegate: AllViewController) {
        
        let url = "https://rc1-hardy.shop/stores/categories"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: Categories.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessCategories(result: response.result)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest(message: "오류가났습니다.")
                }
            }
    }
}

