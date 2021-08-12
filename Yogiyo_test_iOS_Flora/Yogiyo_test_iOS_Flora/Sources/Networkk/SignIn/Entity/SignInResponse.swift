//
//  SignInResponse.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import Foundation

// MARK: - SignInResponse
struct SignInResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignInResult?
}

// MARK: - SignInResult
struct SignInResult: Codable {
    let userIdx: Int
    let jwt : String
}


