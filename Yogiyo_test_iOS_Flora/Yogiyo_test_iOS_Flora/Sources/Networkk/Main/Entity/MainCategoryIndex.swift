//
//  MainCategoryIndex.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation

// MARK: - MainCategoryIndex
struct MainCategoryIndex: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [MainResult]
}

// MARK: - MainResult
struct MainResult: Codable {
    let categoryIdx: Int
    let categoryName: String
}
