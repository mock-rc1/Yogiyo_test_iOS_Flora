//
//  EmailSignUpViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

// 해당 페이지에서 고칠 것
// 1. 가리기보기 버튼이 너무 오른쪽에 붙어있음
// 2. 회원가입 되면 탭 요기요 쪽으로 화면전환

import UIKit

class EmailSignUpViewController: BaseViewController {
    
    // MARK: - Properties
    // API 전달
    lazy var dataManager: SignUpDataManager = SignUpDataManager()
    
    // 약관동의 배열
    var terms = Array(repeating: false, count: 5)
    let switchToDigit = [true: 1,false: 0]
    
    // '보기가리기'버튼
    let overlayButton = UIButton(type: .system)
    var iconClick = true
    
    // IBOutlet
    @IBOutlet var btns: [UIButton]!
    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    @IBOutlet weak var nickNameInputTextField: UITextField!
    @IBOutlet weak var allAgreeBtn: UIButton!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var contentBtn1: UIButton!
    @IBOutlet weak var contentBtn2: UIButton!
    @IBOutlet weak var contentBtn3: UIButton!
    @IBOutlet weak var contentBtn4: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 바탕 누르면 키보드 없어지기
        dismissKeyboardWhenTappedAround()
        // 스타일
        setStyle()
        // 보기가리기액션
        textFieldInShowHide()
    }
    
    // MARK: - Function
    // 스타일
    func setStyle() {
        emailInputTextField.clearButtonMode = .always
        passwordInputTextField.rightView = overlayButton
        passwordInputTextField.rightViewMode = .whileEditing
        passwordInputTextField.isSecureTextEntry = true
        nextPageBtn.layer.cornerRadius = 5
    }
    // 텍스트필드 안에 '가리기','보기' 버튼
    func textFieldInShowHide() {
        overlayButton.setTitle("보기", for: .normal)
        overlayButton.addTarget(self, action: #selector(displayButton(_:)),
                                for: .touchUpInside)
        overlayButton.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        overlayButton.sizeToFit()
    }
    @objc func displayButton(_ UIButton: UIButton) {
        if(iconClick == true) {
            overlayButton.setTitle("보기", for: .normal)
            passwordInputTextField.isSecureTextEntry = false
            
        } else {
            overlayButton.setTitle("가리기", for: .normal)
            passwordInputTextField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    // 약관동의 나머지 버튼들 클릭시 호출
    func checkAgree(_ idx: Int) {
        terms[idx] = !terms[idx]
        setAgreeImage(idx)
        
        // 약관동의 배열이 전부 True라면
        if terms.allSatisfy({$0}) {
            // 전체 동의 체크 및 이미지 변경
            allAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            allAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }
        else {
            allAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            allAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
    
    // 나머지 버튼의 체크 이미지 변경
    func setAgreeImage(_ idx: Int) {
        if terms[idx] {
            btns[idx].setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            btns[idx].tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        } else {
            btns[idx].setImage(UIImage(systemName: "squareshape"), for: .normal)
            btns[idx].tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
    
    // MARK: - IBAction
    // 회원가입 완료 버튼
    @IBAction func completeBtnTap(_ sender: Any) {
        // 이메일 텍스트필드에 입력이 없다면
        guard let id = emailInputTextField.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        // 비밀번호 텍스트필드에 입력이 없다면
        guard let password = passwordInputTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        // 닉넥임을 입력하지 않았다면
        guard let nickName = nickNameInputTextField.text?.trim, nickName.isExists else {
            self.presentAlert(title: "닉네임을 입력해주세요")
            return
        }
        // Requst Sign Up
        let input = SignUpRequest(userEmail: id, userPassword: password, userNickname: nickName, termsAndConditions: switchToDigit[terms[0]]!, personalInfo: switchToDigit[terms[1]]!, financialTrans: switchToDigit[terms[2]]!, aboveFourteen: switchToDigit[terms[3]]!, benefitAlarm: switchToDigit[terms[4]]!)
        dataManager.postSignUp(input, delegate: self)
    }
    
    // 취소 버튼
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // '전체동의' 버튼
    @IBAction func allAgreeBtnTap (_ sender: UIButton) {
        if terms.allSatisfy({$0}){
            allAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            allAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            terms = Array(repeating: false, count: 5)
        }
        else {
            allAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            allAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            terms = Array(repeating: true, count: 5)
        }
        for idx in 0..<terms.count {
            setAgreeImage(idx)
        }
    }
    
    // 약관동의 나머지 버튼들
    @IBAction func btn1(_ sender: UIButton) {
        checkAgree(0)
    }
    @IBAction func btn2(_ sender: UIButton) {
        checkAgree(1)
    }
    @IBAction func btn3(_ sender: UIButton) {
        checkAgree(2)
    }
    @IBAction func btn4(_ sender: UIButton) {
        checkAgree(3)
    }
    @IBAction func btn5(_ sender: UIButton) {
        checkAgree(4)
    }
}

// MARK: - API
extension EmailSignUpViewController {
    // 회원가입에 성공했을 때
    func didSuccessSignUp(_ result: SignUpResult) {
        self.presentAlert(title: "회원가입에 성공하였습니다", message: "자동으로 로그인 되셨습니다", isCancelActionIncluded: true) { action in
            UserDefaults.standard.set(result.jwt, forKey: "userToken") // 토큰 저장
            let mainTabBarController = UIStoryboard(name: "MyYogiyoStoryboard", bundle: nil).instantiateViewController(identifier: "MyYogiyoViewController")
            self.changeRootViewController(mainTabBarController)
        }
    }
    // 회원가입에 실패했을 때
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
