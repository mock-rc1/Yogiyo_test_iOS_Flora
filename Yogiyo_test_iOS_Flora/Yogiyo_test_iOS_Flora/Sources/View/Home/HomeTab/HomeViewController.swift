//
//  HomeViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var dataManager: MainIndexDataManager = MainIndexDataManager()
    
    // 요즘뜨는 우리동네 부분 유아이 이상하니까 그냥 요기요 익스프레스 셀로 뿌려주기
    let sections: [String] = ["배너", "버튼4개", "서치바아이콘", "요기요익스프레스","광고","요즘뜨는 우리동네가게", "요기서먹어요헤더","요기서먹어요"]
    
    var todayYogi = [1,2,3,4,5,6]
    
    var mainIndex : [MainResult] = []
    
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
        
        dataManager.getMainIndex(delegate: self)
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
    
    @IBAction func currentLocationBtnTap(_ sender: Any) {
        let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: CurrentLocationVC.self)).instantiateViewController(withIdentifier: "CurrentLocationVC") as! CurrentLocationVC
        
        storyboardVC.modalPresentationStyle = .fullScreen
        self.present(storyboardVC, animated: true, completion: nil)
        
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
            return 1
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
            
            //foodCategoryVC!.allFoodBtn?.tag = mainIndex[0].categoryIdx
//            foodCategoryVC!.ChineseFoodBtn.tag = mainIndex[1].categoryIdx
//            foodCategoryVC!.ChickenBtn.tag = mainIndex[2].categoryIdx
//            foodCategoryVC!.KoreanFoodBtn.tag = mainIndex[3].categoryIdx
//            foodCategoryVC!.BurgerBtn.tag = mainIndex[4].categoryIdx
//            foodCategoryVC!.PizzaBtn.tag = mainIndex[5].categoryIdx
//            foodCategoryVC!.SoupBtn.tag = mainIndex[6].categoryIdx
//            foodCategoryVC!.CafeBtn.tag = mainIndex[7].categoryIdx
//            foodCategoryVC!.BunsikBtn.tag = mainIndex[8].categoryIdx
//            foodCategoryVC!.SinglePersonBtn.tag = mainIndex[9].categoryIdx
//            foodCategoryVC!.JapaneseBtn.tag = mainIndex[10].categoryIdx
//            foodCategoryVC!.NightBtn.tag = mainIndex[11].categoryIdx
//            foodCategoryVC!.PigBtn.tag = mainIndex[12].categoryIdx
//            foodCategoryVC!.FranchiseBtn.tag = mainIndex[13].categoryIdx
//            foodCategoryVC!.yomartBtn.tag = mainIndex[14].categoryIdx
//            foodCategoryVC!.BeautyBtn.tag = mainIndex[15].categoryIdx
//            foodCategoryVC!.PetBtn.tag = mainIndex[16].categoryIdx
            
            return cell
        }
        
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpressTVCell.identifier) as? ExpressTVCell else{
                return UITableViewCell()
            }
            if indexPath.row == 0 {
                
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
            return 160
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
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
          titleLabel.frame = CGRect(x: 20, y: 10, width: headerView.frame.width, height: headerView.frame.height)
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

extension HomeViewController {
    func didSuccessMainIndex(result: [MainResult]) {
        //self.dismissIndicator()
        
        print("메인리절트", result)
        
        self.mainIndex = result
        print("메인인뎃그",mainIndex[0])
        
        //UserDefaults.standard.set(result.userNickname, forKey: "userNickname")
        mainTableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}

