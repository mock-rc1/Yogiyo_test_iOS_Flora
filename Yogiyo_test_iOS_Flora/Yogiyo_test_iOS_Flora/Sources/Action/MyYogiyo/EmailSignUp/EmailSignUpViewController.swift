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
    
    @IBOutlet weak var emailInputTextField: UITextField!
    @IBOutlet weak var passwordInputTextField: UITextField!
    @IBOutlet weak var nickNameInputTextField: UITextField!
    @IBOutlet weak var allAgreeBtn: UIButton!
    @IBOutlet weak var useAgreeBtn: UIButton!
    @IBOutlet weak var privacyAgreeBtn: UIButton!
    @IBOutlet weak var moneyAgreeBtn: UIButton!
    @IBOutlet weak var ageAgreeBtn: UIButton!
    @IBOutlet weak var saleAgreeBtn: UIButton!
    @IBOutlet weak var nextPageBtn: UIView!
    @IBOutlet weak var contentBtn1: UIButton!
    @IBOutlet weak var contentBtn2: UIButton!
    @IBOutlet weak var contentBtn3: UIButton!
    @IBOutlet weak var contentBtn4: UIButton!
    
    let overlayButton = UIButton(type: .system)
    var iconClick = true
    var buttonClick = true

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        textFieldStyle()
        textFieldInShowHide()
        
    }
    // 텍스트필드 스타일
    func textFieldStyle() {
        emailInputTextField.clearButtonMode = .always
        passwordInputTextField.rightView = overlayButton
        passwordInputTextField.rightViewMode = .whileEditing
        passwordInputTextField.isSecureTextEntry = true
    }
    
    // UIView tap gesture
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
        self.nextPageBtn.addGestureRecognizer(tapGesture)
    }
    @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
        // 페이지 생성할건지 말건지 알게되면 그때 하자
//        guard let dvc = self.storyboard?.instantiateViewController(identifier: "")else{return}
//        self.present(dvc, animated: true, completion:nil)
     print("tap")
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
    
//    func buttonTag() {
//        allAgreeBtn.tag = 1
//        useAgreeBtn.tag = 2
//        privacyAgreeBtn.tag = 3
//        moneyAgreeBtn.tag = 4
//        ageAgreeBtn.tag = 5
//        saleAgreeBtn.tag = 6
//    }
    
    // 취소 버튼
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 약관 동의 버튼
    @IBAction func allAgreeBtnTap (_ sender: UIButton) {
        print("눌린다")
        if (buttonClick == true) {
            allAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            moneyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            saleAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
            allAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            useAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            privacyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            moneyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            ageAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            saleAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        else {
            allAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            moneyAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            saleAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            allAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            useAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            privacyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            moneyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            ageAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
            saleAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func useAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            useAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            useAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            useAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            useAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func privacyAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            privacyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            privacyAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            privacyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func financeAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            moneyAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            moneyAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            moneyAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            moneyAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func ageAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            ageAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            ageAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            ageAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    @IBAction func yogiyoAgreeBtnTap (_ sender: UIButton) {
        if (buttonClick == true) {
            saleAgreeBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            saleAgreeBtn.tintColor = #colorLiteral(red: 0.9745565057, green: 0.008201596327, blue: 0.3125460446, alpha: 1)
        }else{
            saleAgreeBtn.tintColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            saleAgreeBtn.setImage(UIImage(systemName: "squareshape"), for: .normal)
        }
        buttonClick = !buttonClick
    }
    
    
}



