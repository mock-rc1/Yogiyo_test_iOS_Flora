//
//  HomeViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class HomeViewController: UIViewController {
    // 섹션헤더뷰에 컬렉션뷰 넣을 수 있나? 아니면 셀 만들어서 그걸 코드로 넣을 수 있나? 해보기
    // 요즘뜨는 우리동네 부분 유아이 이상하니까 그냥 요기요 익스프레스 셀로 뿌려줘
    let sections: [String] = ["배너", "버튼4개", "서치바아이콘", "요기요익스프레스","광고","요즘뜨는 우리동네가게", "요기서먹어요헤더","요기서먹어요"]
    
    var hotStore = [1,2,3]
    var todayYogi = [1,2,3,4,5,6]
    
    // 버튼 네개 있는 셀
    var fourthBtnVC : FourthBtnConVC?
    // 음식 카테고리
    var foodCategoryVC : CategoryFoodConVC?
    // 해시태그 헤더
    var homeHashTagVC : HomeHashTagVC?
    
    
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
        //mainTableView.estimatedSectionHeaderHeight = 50
        //mainTableView.sectionHeaderHeight = UITableView.automaticDimension
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
        self.mainTableView.register(MiddleBannerTVCell.nib(), forCellReuseIdentifier: MiddleBannerTVCell.identifier)
        self.mainTableView.register(HotOurStoreTVCell.nib(), forCellReuseIdentifier: HotOurStoreTVCell.identifier)
        self.mainTableView.register(TodayYogiTVCell.nib(), forCellReuseIdentifier: TodayYogiTVCell.identifier)
        
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
        else if section == 5 {
            return hotStore.count
        }
        else if section == 6 {
            return 0
        }
        else if section == 7 {
            return todayYogi.count
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
        
        if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MiddleBannerTVCell.identifier) as? MiddleBannerTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HotOurStoreTVCell.identifier) as? HotOurStoreTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        if indexPath.section == 7 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayYogiTVCell.identifier) as? TodayYogiTVCell else{
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
            return 260
        }
        else if indexPath.section == 4 {
            return 130
        }
        else if indexPath.section == 5 {
            return 270
        }
        else if indexPath.section == 7 {
            return 200
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        if section == 1 {
            return 0
        }
        if section == 2 {
            return 0
        }
        if section == 3 {
            return 0
        }
        if section == 4 {
            return 0
        }
        if section == 5 {
            return 0
        }
        if section == 6 {
            return 50
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
          return UIView(frame: .null)
        }
        if section == 2 {
          return UIView(frame: .null)
        }
        if section == 3 {
          return UIView(frame: .null)
        }
        if section == 4 {
          return UIView(frame: .null)
        }
        if section == 5 {
          return UIView(frame: .null)
        }
        if section == 6 {
          let headerView = UIView()
          headerView.backgroundColor = .white
          headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
          
          let titleLabel = UILabel()
          titleLabel.textColor = .black
          titleLabel.text = "오늘은 요기서 먹어요"
          titleLabel.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
          headerView.addSubview(titleLabel)
          
          return headerView
        }
        else {
            homeHashTagVC = HomeHashTagVC(nibName: "HomeHashTagVC", bundle: nil)
            
          let headerView = UIView()
          headerView.backgroundColor = .red
          headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
          
            headerView.addSubview(homeHashTagVC!.view)
            
            self.addChild(homeHashTagVC!)
            
            // autolayout
            homeHashTagVC!.view.translatesAutoresizingMaskIntoConstraints = false
         
            homeHashTagVC!.view.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
            homeHashTagVC!.view.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
            homeHashTagVC!.view.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
            homeHashTagVC!.view.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            homeHashTagVC!.didMove(toParent: self)

          
          return headerView
        }
    }
    
}
