//
//  StoreFood.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation

// MARK: - StoreFood
struct StoreFood: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [StoreFoodResult]
}

// MARK: - StoreFoodResult
struct StoreFoodResult: Codable {
    let menuIdx: Int
    let menuName, menuPrice: String
    let menuImageURL, menuInfo: String?
    let menuCategory: String

    enum CodingKeys: String, CodingKey {
        case menuIdx, menuName, menuPrice
        case menuImageURL = "menuImageUrl"
        case menuInfo, menuCategory
    }
}
