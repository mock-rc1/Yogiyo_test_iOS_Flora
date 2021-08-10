//
//  Categories.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let storeIdx, categoryIdx: Int
    let storeName, storeRating, deliveryTime, deliveryTip: String
    let storeAddress: String
    let storeImageURL, storeLogoURL: String?

    enum CodingKeys: String, CodingKey {
        case storeIdx, categoryIdx, storeName, storeRating, deliveryTime, deliveryTip, storeAddress
        case storeImageURL = "storeImageUrl"
        case storeLogoURL = "storeLogoUrl"
    }
}
