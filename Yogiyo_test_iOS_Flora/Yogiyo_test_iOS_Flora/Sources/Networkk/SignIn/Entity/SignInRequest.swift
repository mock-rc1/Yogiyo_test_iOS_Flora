//
//  SignInRequest.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/05.
//

import Foundation

// 변수명 에이피아이 명세서랑 같게
struct SignInRequest: Encodable {
    var userEmail: String
    var userPassword: String
}
