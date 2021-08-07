//
//  Users.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import Foundation

// MARK: - SignUpData
struct SignUpData: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignUpResult?
}

// MARK: - Result
struct SignUpResult: Codable {
    let jwt: String
    let userIdx: Int
}

