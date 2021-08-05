//
//  emailLoginViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class emailLoginViewController: UIViewController {
    lazy var dataManager: SignInDataManager = SignInDataManager()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let overlayButton = UIButton(type: .system)
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        textFieldInShowHide()
        setStyle()
    }
    
    // 스타일
    func setStyle() {
        emailTextField.clearButtonMode = .always
        passwordTextField.rightView = overlayButton
        passwordTextField.rightViewMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
        emailLoginBtn.layer.cornerRadius = 5
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
            passwordTextField.isSecureTextEntry = false
            
        } else {
            overlayButton.setTitle("가리기", for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }

    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func emailLoginBtnTap(_ sender: Any) {
        
        //self.dismiss(animated: true, completion: nil)
        guard let id = emailTextField.text?.trim, id.isExists else {
            self.presentAlert(title: "아이디를 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = passwordTextField.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        
        // Requst Sign In
        self.dismissKeyboard()
        //self.showIndicator()
        let input = SignInRequest(userEmail: id, userPassword: password)
        dataManager.postSignIn(input, delegate: self)
    }
   
    @IBAction func emailSignUpBtnTap(_ sender: Any) {
        // 이메일 회원가입 부분으로 뷰 보내기 디스미스 후 프리젠트
    }
}

extension emailLoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        emailTextField.layer.borderWidth = 1
//        emailTextField.layer.borderColor = UIColor.red.cgColor
        print("textFieldDidBeginEditing: \((textField.text) ?? "Empty")") }

}

extension emailLoginViewController {
    func didSuccessSignIn(_ result: SignInResult) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "YogiyoTabBarVC")else{return}
        self.navigationController?.pushViewController(dvc, animated: true)
        self.presentAlert(title: "로그인에 성공하였습니다", message: result.jwt)
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
