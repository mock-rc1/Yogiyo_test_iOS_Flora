//
//  UserNickname.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/12.
//

import Foundation

// MARK: - UserNicknameResponse
struct UserNicknameResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
