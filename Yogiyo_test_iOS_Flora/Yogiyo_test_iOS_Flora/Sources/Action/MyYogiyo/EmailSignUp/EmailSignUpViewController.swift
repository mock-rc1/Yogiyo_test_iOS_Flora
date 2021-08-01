//
//  EmailSignUpViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class EmailSignUpViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let emailTextFieldList = [1,2,3]
    let agree = [1,2,3,4,5]
    
    let sections: [String] = ["이메일", "전체동의", "버튼"]
    
    let overlayButton = UIButton(type: .system)
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // 테이블 뷰 경계션 없애기
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        self.tableView.register(EmailPassTableViewCell.nib(), forCellReuseIdentifier: EmailPassTableViewCell.identifier)
        self.tableView.register(AgreeTableViewCell.nib(), forCellReuseIdentifier: AgreeTableViewCell.identifier)
        self.tableView.register(CompleteTableViewCell.nib(), forCellReuseIdentifier: CompleteTableViewCell.identifier)
        
    }
    
    //'x'버튼
    @IBAction func backBtnTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}


extension EmailSignUpViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emailTextFieldList.count
            
        } else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EmailPassTableViewCell.identifier) as? EmailPassTableViewCell else{
                return UITableViewCell()
            }
            if indexPath.row == 0 {
                cell.addressName.text = "이메일 주소"
                cell.emailTextField.placeholder = "이메일 주소 입력"
                cell.emailTextField.clearButtonMode = .always
            }
            if indexPath.row == 1 {
                overlayButton.setTitle("보기", for: .normal)
                overlayButton.addTarget(self, action: #selector(displayButton(_:)),
                                        for: .touchUpInside)
                overlayButton.sizeToFit()
                cell.addressName.text = "비밀번호"
                cell.emailTextField.placeholder = "영문, 숫자, 특수문자 포함 8자리 이상"
                cell.emailTextField.rightView = overlayButton
                cell.emailTextField.rightViewMode = .whileEditing
                
                if(iconClick == true) {
                    cell.emailTextField.isSecureTextEntry = true
                    
                } else {
                    cell.emailTextField.isSecureTextEntry = false
                }
                iconClick = !iconClick
            }
            if indexPath.row == 2 {
                cell.addressName.text = "닉네임"
                cell.emailTextField.placeholder = "닉네임 (권장)"
            }
            
            return cell
        }else if(indexPath.section == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AgreeTableViewCell.identifier) as? AgreeTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        else if(indexPath.section == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CompleteTableViewCell.identifier) as? CompleteTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    @objc func displayButton(_ UIButton: UIButton) {
        
        if(iconClick == true) {
            overlayButton.setTitle("보기", for: .normal)
            
        } else {
            overlayButton.setTitle("가리기", for: .normal)
        }
        iconClick = !iconClick
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 110
        }else if(indexPath.section == 1){
            return 400
        }else if(indexPath.section == 2){
            return 110
        }else{
            return 0
        }
    }
}

