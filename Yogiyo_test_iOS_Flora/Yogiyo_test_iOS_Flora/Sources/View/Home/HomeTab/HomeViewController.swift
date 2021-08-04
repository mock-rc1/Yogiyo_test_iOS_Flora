//
//  HomeViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sections: [String] = ["배너", "버튼4개", "서치바아이콘", "요기요익스프레스","광고", "요기서먹어요"]
    
    // 버튼 네개 있는 셀
    var fourthBtnVC : FourthBtnConVC?
    // 음식 카테고리
    var foodCategoryVC : CategoryFoodConVC?
    
    
    // MARK: - Properties
    @IBOutlet weak var currentLocationBtn: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var alertBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setStyle()
        setCellRegister()
        
    }
    
    // MARK: - Fuction
    // tableview delegate & datasource
    func setDelegate() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        mainTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // setCellRegister
    func setCellRegister() {
        // cell
        self.mainTableView.register(BannerTVCell.nib(), forCellReuseIdentifier: BannerTVCell.identifier)
        self.mainTableView.register(ExpressTVCell.nib(), forCellReuseIdentifier: ExpressTVCell.identifier)
        // controller cell
        self.mainTableView.register(UINib(nibName: "FourthButtonTVCell", bundle: nil),
                                   forCellReuseIdentifier: "FourthButtonTVCell")
        self.mainTableView.register(UINib(nibName: "FoodCategoryTVCell", bundle: nil),
                                   forCellReuseIdentifier: "FoodCategoryTVCell")
    }
    
}

// MARK: - Extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else if section == 1 {
            return 1
        }
        else if section == 2 {
            return 1
        }
        else if section == 3 {
            return 1
        }
        else if section == 4 {
            return 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTVCell.identifier) as? BannerTVCell else{
                return UITableViewCell()
            }
            
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "FourthButtonTVCell",for: indexPath) as! FourthButtonTVCell
            
            fourthBtnVC = FourthBtnConVC(nibName: "FourthBtnConVC",
                                              bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(fourthBtnVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(fourthBtnVC!)
            
            // autolayout
            fourthBtnVC!.view.translatesAutoresizingMaskIntoConstraints = false
            fourthBtnVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            fourthBtnVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            fourthBtnVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            fourthBtnVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            fourthBtnVC!.didMove(toParent: self)
            
            return cell
        }
        else if indexPath.section == 2 {
            
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "FoodCategoryTVCell",for: indexPath) as! FoodCategoryTVCell
            
            foodCategoryVC = CategoryFoodConVC(nibName: "CategoryFoodConVC",
                                              bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(foodCategoryVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(foodCategoryVC!)
            
            // autolayout
            foodCategoryVC!.view.translatesAutoresizingMaskIntoConstraints = false
            foodCategoryVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            foodCategoryVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            foodCategoryVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            foodCategoryVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            foodCategoryVC!.didMove(toParent: self)
            
            return cell
        }
        
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpressTVCell.identifier) as? ExpressTVCell else{
                return UITableViewCell()
            }
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
            return 180
        }
        else if indexPath.section == 1 {
            return 150
        }
        else if indexPath.section == 2 {
            return 480
        }
        else if indexPath.section == 3 {
            return 500
        }
        else if indexPath.section == 4 {
            return 150
        }
        else {
            return 0
        }
    }
    
}
