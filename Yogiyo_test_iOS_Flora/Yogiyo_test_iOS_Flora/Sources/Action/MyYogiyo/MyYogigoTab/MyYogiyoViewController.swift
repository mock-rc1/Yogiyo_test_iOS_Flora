//
//  MyYogiyoViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class MyYogiyoViewController: UIViewController {
    
    @IBOutlet weak var MyYogiyoTableView: UITableView!
    
    let sections: [String] = ["로그인전후화면", "쿠폰함", "카테고리"]
    let category = [1,2,3,4,5,6,7]
    var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyYogiyoTableView.delegate = self
        MyYogiyoTableView.dataSource = self
        // 테이블 뷰 경계션 없애기
        MyYogiyoTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        
        self.MyYogiyoTableView.register(NoUserTableViewCell.nib(), forCellReuseIdentifier: NoUserTableViewCell.identifier)
        self.MyYogiyoTableView.register(MyYogiyoTableViewCell.nib(), forCellReuseIdentifier: MyYogiyoTableViewCell.identifier)
        self.MyYogiyoTableView.register(MyYogiyoLoginTableViewCell.nib(), forCellReuseIdentifier: MyYogiyoLoginTableViewCell.identifier)
        self.MyYogiyoTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
    }
    
    // 로그인버튼
    @IBAction func loginBtnTap(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") as? NavigationViewController else { return }
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true)
    }
    
}


extension MyYogiyoViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else if section == 1 {
            return 1
        }
        else if section == 2 {
            return category.count
        }
        else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyYogiyoLoginTableViewCell.identifier) as? MyYogiyoLoginTableViewCell else{
                return UITableViewCell()
            }
            cell.userNameLabel.text = userMainData.shared.loginUser
            return cell
        }
        else if(indexPath.section == 1) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyYogiyoTableViewCell.identifier) as? MyYogiyoTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        else if(indexPath.section == 2) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier) as? CategoryTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 150
        }else if(indexPath.section == 1){
            return 110
        }else if(indexPath.section == 2){
            return 50
        }else{
            return 0
        }
    }
    
    
}
