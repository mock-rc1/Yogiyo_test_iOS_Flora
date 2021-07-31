//
//  emailLoginViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class emailLoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self

    }

    @IBAction func backBtnTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension emailLoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        emailTextField.layer.borderWidth = 1
//        emailTextField.layer.borderColor = UIColor.red.cgColor
        print("textFieldDidBeginEditing: \((textField.text) ?? "Empty")") }

}
