//
//  AllViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/06.
//

import UIKit
import XLPagerTabStrip

class AllViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var AllTableView: UITableView!
    
    var sections = ["우리동네플러스","요기요등록가게"]
    var myStore = [1,2,3]
    var yogiyoRegister = [1,2,3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setStyle()
        //setRegister()
        
        self.AllTableView.register(MyStoreTableViewCell.nib(), forCellReuseIdentifier: MyStoreTableViewCell.identifier)
        
        AllTableView.separatorColor = UIColor.clear
        
        //AllTableView.tableFooterView = UIView(frame: .zero)
        AllTableView.sectionFooterHeight = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDelegate() {
        AllTableView.delegate = self
        AllTableView.dataSource = self
    }
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        AllTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "전체")
    }
    
}

extension AllViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myStore.count
        }
        else if section == 1 {
            return yogiyoRegister.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyStoreTableViewCell.identifier) as? MyStoreTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
        if indexPath.section == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MyStoreTableViewCell.identifier) as? MyStoreTableViewCell else{
                    return UITableViewCell()
                }
                return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 130
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
        if section == 0 {
            let headerView = UIView()
            headerView.backgroundColor = .white
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
            
            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.text = "우리동네 플러스"
            titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            titleLabel.frame = CGRect(x: 20, y: 15, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
        }
        else if section == 1 {
          let headerView = UIView()
          headerView.backgroundColor = .white
          headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
          
          let titleLabel = UILabel()
          titleLabel.textColor = .black
          titleLabel.text = "요기요 등록 가게"
            titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
          titleLabel.frame = CGRect(x: 20, y: 15, width: headerView.frame.width, height: headerView.frame.height)
          headerView.addSubview(titleLabel)
          
          return headerView
        }
        return UIView()
    }
}
