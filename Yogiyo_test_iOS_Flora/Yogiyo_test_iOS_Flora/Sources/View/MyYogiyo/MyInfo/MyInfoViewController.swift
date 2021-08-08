//
//  MyInfoViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/08.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    lazy var dataManager: UserInfoDataManager = UserInfoDataManager()

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var MyInfoTableView: UITableView!
    
    var loginLogoutVC : LoginLogoutConVC?
    var myInfo = ["이메일","패스워드","전화번호","닉네임"]
    var sections = ["이메일셀","로그인로그아웃버튼셀"]
    
    var userInfo: UserResult
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setStyle()
        setCellRegister()

    }
    
    // MARK: - Fuction
    // tableview delegate & datasource
    func setDelegate() {
        MyInfoTableView.delegate = self
        MyInfoTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        MyInfoTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // setCellRegister
    func setCellRegister() {
        
        // cell
        self.MyInfoTableView.register(UINib(nibName: "MyInfoTVCell", bundle: nil),
                                   forCellReuseIdentifier: "MyInfoTVCell")
        // controller cell
        self.MyInfoTableView.register(UINib(nibName: "LoginLogoutTVCell", bundle: nil),
                                   forCellReuseIdentifier: "LoginLogoutTVCell")
    }
 
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myInfo.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInfoTVCell.identifier) as? MyInfoTVCell else{
                return UITableViewCell()
            }
                if indexPath.row == 0 {
                    cell.titleNameLabel.text = "이메일 아이디"
                    cell.changeBtn.isHidden = true
                    cell.myInfoLabel.text = userInfo.userEmail
                } else if indexPath.row == 1 {
                    cell.titleNameLabel.text = "비밀번호"
                    cell.changeBtn.isHidden = true
                    cell.myInfoLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                }
                else if indexPath.row == 2 {
                    // 등록버튼 눌렀을 때 알림창 뜨게하기
                    cell.titleNameLabel.text = "휴대 전화 번호"
                    cell.myInfoLabel.text = "휴대 전화 번호를 등록해 주세요"
                    cell.myInfoLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                    cell.changeBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                    cell.changeBtn.layer.borderWidth = 0
                    cell.changeBtn.layer.backgroundColor = #colorLiteral(red: 0.9788426757, green: 0.004011814948, blue: 0.3122545183, alpha: 1)
                    cell.changeBtn.setTitle("등록", for: .normal)
                }
                else if indexPath.row == 3 {
                    cell.titleNameLabel.text = "닉네임"
                    cell.myInfoLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                }
                
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = MyInfoTableView.dequeueReusableCell(withIdentifier: "LoginLogoutTVCell",for: indexPath) as! LoginLogoutTVCell
            
            loginLogoutVC = LoginLogoutConVC(nibName: "LoginLogoutConVC",
                                              bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(loginLogoutVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(loginLogoutVC!)
            
            // autolayout
            loginLogoutVC!.view.translatesAutoresizingMaskIntoConstraints = false
            loginLogoutVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            loginLogoutVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            loginLogoutVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            loginLogoutVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            loginLogoutVC!.didMove(toParent: self)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        else if indexPath.section == 1 {
            return 50
        }
        else {
            return 0
        }
    }
}

extension MyInfoViewController {
    func didSuccessUserInfo(result: UserResult) {
        //self.dismissIndicator()
        
        userInfo = result
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
