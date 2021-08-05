//
//  SignUpRequest.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/04.
//

import Foundation
// 변수명 에이피아이 명세서랑 같게
struct SignUpRequest: Encodable {
    var userEmail: String
    var userPassword: String
    var userNickname: String
    
    var termsAndConditions: Int
    var personalInfo: Int
    var financialTrans: Int
    var aboveFourteen: Int
    var benefitAlarm: Int
}
