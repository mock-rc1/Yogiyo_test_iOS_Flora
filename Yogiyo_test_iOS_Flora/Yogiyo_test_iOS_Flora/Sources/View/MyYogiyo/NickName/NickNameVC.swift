//
//  NickNameVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class NickNameVC: UIViewController {
    
    lazy var dataManager: UserNicknameDataManager  = UserNicknameDataManager()
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nickNameChangeCompleteBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nickNameChangeBtnTap(_ sender: Any) {
        
        guard let nickName = nickNameTextField.text?.trim, nickName.isExists else {
            self.presentAlert(title: "닉네임을 입력해주세요")
            return
        }
        let input = UserNicknameRequest(userNickname: nickName)
        dataManager.patchUserNickname(input, delegate: self)
    }
    
}

extension NickNameVC {
    func didSuccessUserNicknameChange(result: UserNicknameResponse) {
        print("닉네임변경성공")
        UserDefaults.standard.string(forKey: "userNickname")
        //self.dismissIndicator()
        self.presentAlert(title: "닉네임이 변경되었습니다.", isCancelActionIncluded: true) {
            action in
            
            //                        let storyboardVC = UIStoryboard(name: "MyYogiyoStoryboard", bundle: Bundle(for: MyYogiyoViewController.self)).instantiateViewController(withIdentifier: "MyYogiyoViewController") as! MyYogiyoViewController
            //
            //            self.dismiss(animated: true) {
            //                self.present(storyboardVC, animated: true, completion: nil)
            //            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
