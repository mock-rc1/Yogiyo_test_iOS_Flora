//
//  StoreFoodDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation
import Alamofire

class StoreFoodDataManager {
    
    func getStoreFood(delegate: restaurantViewController) {
        
        var url: String
        
        if let storeIndex = UserDefaults.standard.string(forKey: "storeIdx") {
            url = "https://rc1-hardy.shop/stores/\(storeIndex)/menus"
        }
        else {
            url = "https://rc1-hardy.shop/stores"
        }
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: StoreFood.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessStoreFood(result: response.result)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest2(message: "오류가났습니다.")
                }
            }
    }
}

