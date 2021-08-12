//
//  AppDelegate.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit
import KakaoSDKCommon
import NaverThirdPartyLogin
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        sleep(3)//5초간스플래시나오게
        
        // 카카오 키
        KakaoSDKCommon.initSDK(appKey: "fbe44eaca4bd9a9c16541f9eef9cdd5b")
        
        // 네이버
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
            
            // 네이버 앱으로 인증하는 방식을 활성화
            instance?.isNaverAppOauthEnable = true
            
            // SafariViewController에서 인증하는 방식을 활성화
            instance?.isInAppOauthEnable = true
            
            // 인증 화면을 iPhone의 세로 모드에서만 사용하기
            instance?.isOnlyPortraitSupportedInIphone()
            
            // 네이버 아이디로 로그인하기 설정
            // 애플리케이션을 등록할 때 입력한 URL Scheme
            instance?.serviceUrlScheme = kServiceAppUrlScheme
            // 애플리케이션 등록 후 발급받은 클라이언트 아이디
            instance?.consumerKey = kConsumerKey
            // 애플리케이션 등록 후 발급받은 클라이언트 시크릿
            instance?.consumerSecret = kConsumerSecret
            // 애플리케이션 이름
            instance?.appName = kServiceAppName
        
        // 페이스북
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // 네이버
        NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
        
            return true
      }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

