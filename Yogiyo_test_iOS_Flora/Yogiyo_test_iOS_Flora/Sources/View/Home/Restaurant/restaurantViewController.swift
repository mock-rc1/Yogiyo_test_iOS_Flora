//
//  restaurantViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/07.
//

import UIKit

class restaurantViewController: UIViewController, UIScrollViewDelegate {
    
    var sections = ["찜공유까지","탭바"]
    
    // 이미지있는 컨트롤러
    var imageVC : ImageVC?
    // 헤더안에 탭바 컨트롤러
    var headerTabBar : HeaderTabBarVC?
    
    var tabBottom = [1,2,3,4,5,6,7]
    
    
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var navigationBarUIView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var headerViewImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var RestaurantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setDelegate()
        setStyle()
        setCellRegister()
    }
    
    // MARK: - Fuction
    // tableview delegate & datasource
    func setDelegate() {
        RestaurantTableView.delegate = self
        RestaurantTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        RestaurantTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // setCellRegister
    func setCellRegister() {
        // cell
        self.RestaurantTableView.register(MenuTVCell.nib(), forCellReuseIdentifier: MenuTVCell.identifier)
        
        // controller cell
        self.RestaurantTableView.register(UINib(nibName: "ImageTVCell", bundle: nil),
                                          forCellReuseIdentifier: "ImageTVCell")
    }
    
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension restaurantViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else if section == 1 {
            return tabBottom.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "ImageTVCell",for: indexPath) as! ImageTVCell
            
            imageVC = ImageVC(nibName: "ImageVC",
                              bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(imageVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(imageVC!)
            
            // autolayout
            imageVC!.view.translatesAutoresizingMaskIntoConstraints = false
            imageVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            imageVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            imageVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            imageVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            imageVC!.didMove(toParent: self)
            
            return cell
        }
        else if indexPath.section == 1 {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTVCell.identifier) as? MenuTVCell else{
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
            return 500
        }
        else if indexPath.section == 1 {
            return 150
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
        else {
            headerTabBar = HeaderTabBarVC(nibName: "HeaderTabBarVC", bundle: nil)
            
            let headerView = UIView()
            headerView.backgroundColor = .red
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            headerView.addSubview(headerTabBar!.view)
            
            self.addChild(headerTabBar!)
            
            // autolayout
            headerTabBar!.view.translatesAutoresizingMaskIntoConstraints = false
            
            headerTabBar!.view.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
            headerTabBar!.view.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
            headerTabBar!.view.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
            headerTabBar!.view.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            headerTabBar!.didMove(toParent: self)
            
            
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            // 해당 셀을 누르면 'VC' 호출
            let storyboardVC = UIStoryboard(name: "HomeStoryboard", bundle: Bundle(for: FoodChoiceVC.self)).instantiateViewController(withIdentifier: "FoodChoiceVC") as! FoodChoiceVC
            
            
            self.present(storyboardVC, animated: true, completion: nil)
            //self.navigationController?.pushViewController(storyboardVC, animated: true)
        }
    }
    
}
