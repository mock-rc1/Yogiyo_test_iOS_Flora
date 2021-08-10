//
//  JjimViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class JjimViewController: UIViewController {
    
    var sections = ["찜","최근본가게"]
    var currentStore = [1,2,3,4]
    var jjim : jjimVC?
    var recently : RecentlyVC?
    
    @IBOutlet weak var jjimTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jjimTableView.delegate = self
        jjimTableView.dataSource = self
        setStyle()
        setCellRegister()
        jjimTableView.separatorColor = UIColor.clear
        
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        jjimTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    func setCellRegister() {
        
        // conetroller
        self.jjimTableView.register(UINib(nibName: "JjimTVCell", bundle: nil),
                                   forCellReuseIdentifier: "JjimTVCell")
        self.jjimTableView.register(UINib(nibName: "RecentlyViewTVCell", bundle: nil),
                                         forCellReuseIdentifier: "RecentlyViewTVCell")
    }
}

extension JjimViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return currentStore.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = jjimTableView.dequeueReusableCell(withIdentifier: "JjimTVCell",for: indexPath) as! JjimTVCell
            
            jjim = jjimVC(nibName: "jjimVC",
                                         bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(jjim!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(jjim!)
            
            // autolayout
            jjim!.view.translatesAutoresizingMaskIntoConstraints = false
            jjim!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            jjim!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            jjim!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            jjim!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            jjim!.didMove(toParent: self)
            
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = jjimTableView.dequeueReusableCell(withIdentifier: "RecentlyViewTVCell",for: indexPath) as! RecentlyViewTVCell
            
            recently = RecentlyVC(nibName: "RecentlyVC",
                                         bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(recently!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(recently!)
            
            // autolayout
            recently!.view.translatesAutoresizingMaskIntoConstraints = false
            recently!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            recently!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            recently!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            recently!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            recently!.didMove(toParent: self)
            
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
            return 170
        }
        else if indexPath.section == 1 {
            return 110
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView(frame: .null)
        }
        if section == 1 {
            let headerView = UIView()
            headerView.backgroundColor = #colorLiteral(red: 0.9362766743, green: 0.941405654, blue: 0.9368326068, alpha: 1)
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.text = "최근 본 가게"
            titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            titleLabel.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
        }
     return UIView()
    }
    
    
}

