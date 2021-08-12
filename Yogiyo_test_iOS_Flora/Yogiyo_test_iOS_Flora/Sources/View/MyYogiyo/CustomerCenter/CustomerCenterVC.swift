//
//  CustomerCenterVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class CustomerCenterVC: UIViewController {

    var customer = ["자주 묻는 질문", "상담톡", "입점 문의하기"]
    @IBOutlet weak var customerTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customerTableView.delegate = self
        customerTableView.dataSource = self
        setStyle()
        setCellRegister()
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        customerTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    func setCellRegister() {
        // cell
        self.customerTableView.register(CustomerTVCell.nib(), forCellReuseIdentifier: CustomerTVCell.identifier)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        // 뒤로이동추가
    }
}

extension CustomerCenterVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomerTVCell.identifier) as? CustomerTVCell else{
            return UITableViewCell()
            
        }
        
        if indexPath.row == 1 {
            cell.iconImage.image = #imageLiteral(resourceName: "카톡")
            cell.nameLabel.text = "상담톡"
            
        }
        if indexPath.row == 2 {
            cell.iconImage.image = #imageLiteral(resourceName: "마켓")
            cell.nameLabel.text = "입점 문의하기"
            
        }
        cell.selectionStyle = .none
        return cell
    }
    
}
