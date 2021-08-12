//
//  StoreInfoDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation
import Alamofire

class StoreInfoDataManager {
    
    func getStoreInfo(delegate: restaurantViewController) {
        
        var url: String
        
        if let storeIndex = UserDefaults.standard.string(forKey: "storeIdx") {
            url = "https://rc1-hardy.shop/stores/\(storeIndex)"
        }
        else {
            url = "https://rc1-hardy.shop/stores"
        }
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: StoreInfo.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessStoreInfo(result: response.result)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest(message: "오류가났습니다.")
                }
            }
    }
}
