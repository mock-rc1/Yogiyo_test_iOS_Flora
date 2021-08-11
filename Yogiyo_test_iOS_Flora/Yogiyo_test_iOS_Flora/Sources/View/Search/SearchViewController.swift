//
//  SearchViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class SearchViewController: UIViewController {
    
    var sections = [1,2]
    var hotSearch = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRegister()
        setDelegate()
        setStyle()
        
    }
    
    func setRegister() {
        self.mainTableView.register(HeaderHotTVCell.nib(), forCellReuseIdentifier: HeaderHotTVCell.identifier)
        self.mainTableView.register(HotMenuTVCell.nib(), forCellReuseIdentifier: HotMenuTVCell.identifier)
    }
    
    func setDelegate() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
}

// MARK: - Extension
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else if section == 1 {
            return 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderHotTVCell.identifier) as? HeaderHotTVCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotMenuTVCell.identifier) as? HotMenuTVCell else{
                return UITableViewCell()
            }
            cell.selectionStyle = .none
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
            return 360
        }
        else if indexPath.section == 1 {
            return 1000
        }
        else {
            return 0
        }
    }
}


