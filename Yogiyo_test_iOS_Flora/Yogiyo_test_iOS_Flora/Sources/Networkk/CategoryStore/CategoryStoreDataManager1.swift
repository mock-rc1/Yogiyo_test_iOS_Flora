//
//  CategoryStoreDataManager.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation
import Alamofire

class CategoryStoreDataManager1 {
    func getCategoryStore1(delegate: ChineseFoodViewController) {
        
        let url = "https://rc1-hardy.shop/stores/categories?categoryIdx=2"

        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"])
            .responseDecodable(of: CategoryStore.self) { response in
                print("response",response)
                switch response.result {
                case .success(let response):
                    print("이거나오면 여기까진온거야")
                    delegate.didSuccessCategoryStore(result: response.result)
                    print("성공햇니",response)
                case .failure(let error):
                    print("오류났슈",error.localizedDescription)
                    delegate.failedToRequest(message: "오류가났습니다.")
                }
            }
    }
}


// 인덱스번호로 해줄거면 이렇게 하자
//func getCategoryStore(idx: Int, delegate: ChineseFoodViewController) {
//
//    let url = "https://rc1-hardy.shop/stores/categories?categoryIdx=\(idx)"
//
//    AF.request(url, method: .get, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"])
//        .responseDecodable(of: CategoryStore.self) { response in
//            print("response",response)
//            switch response.result {
//            case .success(let response):
//                print("이거나오면 여기까진온거야")
//                delegate.didSuccessCategoryStore(result: response.result)
//                print("성공햇니",response)
//            case .failure(let error):
//                print("오류났슈",error.localizedDescription)
//                delegate.failedToRequest(message: "오류가났습니다.")
//            }
//        }
//// )
//}
