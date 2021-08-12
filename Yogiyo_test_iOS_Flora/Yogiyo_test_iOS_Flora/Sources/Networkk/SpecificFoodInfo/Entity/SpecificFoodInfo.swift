//
//  SpecificFoodInfo.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/13.
//

import Foundation

// MARK: - SpecificFoodInfo
struct SpecificFoodInfo: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SpecificFoodInfoResult]
}

// MARK: - Result
struct SpecificFoodInfoResult: Codable {
    let menuIdx: Int
    let menuName, menuPrice: String
    let menuImageURL, menuInfo: String?

    enum CodingKeys: String, CodingKey {
        case menuIdx, menuName, menuPrice
        case menuImageURL = "menuImageUrl"
        case menuInfo
    }
}
