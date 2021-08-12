//
//  SpecificFoodInfoDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/13.
//

import Foundation
import Alamofire

class SpecificFoodInfoDataManager {
    
    func getSpecificFoodInfo(delegate: FoodChoiceVC) {
        
        var url: String
        
        if let storeIndex = UserDefaults.standard.string(forKey: "storeIdx"), let menuIndex = UserDefaults.standard.string(forKey: "menuIdx") {
            url = "https://rc1-hardy.shop/stores/\(storeIndex)/menus/\(menuIndex)"
        }
        else {
            url = "https://rc1-hardy.shop/stores"
        }
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: [ "Content-Type":"application/json"])
            .responseDecodable(of: SpecificFoodInfo.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessSpecificFoodInfo(result: response.result)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest(message: "오류가났습니다.")
                }
            }
    }
}
