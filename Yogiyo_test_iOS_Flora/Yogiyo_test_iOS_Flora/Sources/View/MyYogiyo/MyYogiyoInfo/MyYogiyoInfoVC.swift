//
//  MyYogiyoInfoVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class MyYogiyoInfoVC: UIViewController {
    
    var yogiyoInfo = ["회사소개", "요기요 페이스북", "요기요 블로그", "요기요 안심센터", "요기서결제", "클린리뷰", "회원혜택"]
    @IBOutlet weak var yogiyoInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yogiyoInfoTableView.delegate = self
        yogiyoInfoTableView.dataSource = self
        setStyle()
        setCellRegister()
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        yogiyoInfoTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    func setCellRegister() {
        // cell
        self.yogiyoInfoTableView.register(CustomerTVCell.nib(), forCellReuseIdentifier: CustomerTVCell.identifier)
    }


}

extension MyYogiyoInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yogiyoInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomerTVCell.identifier) as? CustomerTVCell else{
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.iconImage.image = #imageLiteral(resourceName: "안내")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 1 {
            cell.iconImage.image = #imageLiteral(resourceName: "페북")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 2 {
            cell.iconImage.image = #imageLiteral(resourceName: "블로그")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 3 {
            cell.iconImage.image = #imageLiteral(resourceName: "손")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 4 {
            cell.iconImage.image = #imageLiteral(resourceName: "폰")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 5 {
            cell.iconImage.image = #imageLiteral(resourceName: "손잡기")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        else if indexPath.row == 6 {
            cell.iconImage.image = #imageLiteral(resourceName: "메달")
            cell.nameLabel.text = yogiyoInfo[indexPath.row]
        }
        
        return cell
    }
    
}


