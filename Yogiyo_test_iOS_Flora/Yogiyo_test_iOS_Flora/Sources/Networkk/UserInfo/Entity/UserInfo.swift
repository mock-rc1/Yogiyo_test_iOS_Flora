//
//  UserInfo.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UserResult
}

// MARK: - UserResult
struct UserResult: Codable {
    let userIdx: Int
    let userEmail: String
    let userPhoneNum: String?
    let userNickname: String
}
