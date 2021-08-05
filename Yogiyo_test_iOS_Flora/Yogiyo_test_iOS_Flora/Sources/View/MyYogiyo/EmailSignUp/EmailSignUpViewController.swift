//
//  EmailSignUpViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

// 해당 페이지에서 고칠 것
// 1. 가리기보기 버튼이 너무 오른쪽에 붙어있음
// 2. 약관동의 버튼

import UIKit

class EmailSignUpViewController: BaseViewController {
    lazy var dataManager: SignUpDataManager = SignUpDataManager()
    
    @IBOutlet var btns: [UIButton]!
    var terms = Array(repeating: false, count: 5)
    
    
    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    @IBOutlet weak var nickNameInputTextField: UITextField!
    @IBOutlet weak var allAgreeBtn: UIButton!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var contentBtn1: UIButton!
    @IBOutlet weak var contentBtn2: UIButton!
    @IBOutlet weak var contentBtn3: UIButton!
    @IBOutlet weak var contentBtn4: UIButton!
    
    let overlayButton = UIButton(type: .system)
    var iconClick = true
    var buttonClick = true
    
    var buttonState = 0
    var useAgreeBtn = 0
    var privacyAgreeBtn = 0
    var moneyAgreeBtn = 0
    var ageAgreeBtn = 0
    var saleAgreeBtn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        setStyle()
        textFieldInShowHide()
        
        
        
    }
    // 스타일
    func setStyle() {
        emailInputTextField.clearButtonMode = .always
        passwordInputTextField.rightView = overlayButton
        passwordInputTextField.rightViewMode = .whileEditing
        passwordInputTextField.isSecureTextEntry = true
        nextPageBtn.layer.cornerRadius = 5
    }
    
    
    @IBAction func completeBtnTap(_ sender: Any) {
        
        guard let id = emailInputTextField.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = passwordInputTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        guard let nickName = nickNameInputTextField.text?.trim, nickName.isExists else {
            self.presentAlert(title: "닉네임을 입력해주세요")
            return
        }
        
        // Requst Sign In
        self.dismissKeyboard()
        //self.showIndicator()
        let input = SignUpRequest(userEmail: id, userPassword: password, userNickname: nickName, termsAndConditions: useAgreeBtn, personalInfo: privacyAgreeBtn, financialTrans: moneyAgreeBtn, aboveFourteen: ageAgreeBtn, benefitAlarm: saleAgreeBtn)
        dataManager.postSignUp(input, delegate: self)
        
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
    
    // 취소 버튼
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 버튼 클릭시 호출시키기
    func checkAgree(_ idx: Int) {
        
        terms[idx] = !terms[idx]
        setAgreeImage(idx)
        
        // 약관 동의 배열이 전부 True라면
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
    
    // 버튼의 체크 이미지 변경
    func setAgreeImage(_ idx: Int) {
        if terms[idx] {
            btns[idx].setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            btns[idx].tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            buttonState = 1
            useAgreeBtn = 1
            privacyAgreeBtn = 1
            moneyAgreeBtn = 1
            ageAgreeBtn = 1
            saleAgreeBtn = 1
        } else {
            btns[idx].setImage(UIImage(systemName: "squareshape"), for: .normal)
            btns[idx].tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            buttonState = 0
            useAgreeBtn = 0
            privacyAgreeBtn = 0
            moneyAgreeBtn = 0
            ageAgreeBtn = 0
            saleAgreeBtn = 0
        }
    }
    
    // 약관 동의 버튼
    @IBAction func allAgreeBtnTap (_ sender: UIButton) {
        print("눌린다")
        
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

extension EmailSignUpViewController {
    func didSuccessSignUp(_ result: SignUpResult) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "MyYogiyoViewController")else{return}
        self.navigationController?.pushViewController(dvc, animated: true)
        self.presentAlert(title: "회원가입에 성공하였습니다", message: result.jwt)
                
                
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

