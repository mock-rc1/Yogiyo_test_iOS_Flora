//
//  StoreInfo.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation

// MARK: - StoreInfo
struct StoreInfo: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: StoreResult
}

// MARK: - StoreResult
struct StoreResult: Codable {
    let storeIdx, categoryIdx: Int
    let storeName, storeRating, deliveryTime, minOrderPrice: String
    let deliveryTip, storeOpenTime: String
    let storePhoneNum: String?
    let storeAddress, businessName, businessLicenseNum: String
    let storeFoodInfo: String?
    let isDeleted: String
    let status: Int
    let storeImageURL: String

    enum CodingKeys: String, CodingKey {
        case storeIdx, categoryIdx, storeName, storeRating, deliveryTime, minOrderPrice, deliveryTip, storeOpenTime, storePhoneNum, storeAddress, businessName, businessLicenseNum, storeFoodInfo, isDeleted, status
        case storeImageURL = "storeImageUrl"
    }
}
