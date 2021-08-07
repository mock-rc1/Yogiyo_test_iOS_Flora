//
//  userDataTest.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/02.
//

import Foundation
import UIKit

class userMainData {
    static let shared = userMainData()
    var loginUser : String?
    private init(){}
}
