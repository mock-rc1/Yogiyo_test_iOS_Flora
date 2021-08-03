//
//  MyYogiyoViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/07/31.
//

import UIKit

class MyYogiyoViewController: UIViewController {
    
    @IBOutlet weak var MyYogiyoTableView: UITableView!
    
    // 로그인되면
    var isLogin: Bool = false {
        didSet { MyYogiyoTableView.reloadData() }
    }
    
    // 로그인전
    var beforeLoginVC : BeforeLoginConVC?
    // 로그인후
    var completeLoginVC : CompleteLoginVC?
    // 쿠폰함
    var couponVC : CouponConVC?
    // 카테고리
    var categoryVC : CategotyViewController?
    
    
    let sections: [String] = ["로그인전후화면", "쿠폰함", "카테고리"]
    let category = [1,2,3,4,5,6,7]
    //var userName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //didSuccessLoginAPI()
        // 테이블뷰델리게이트
        MyYogiyoTableView.delegate = self
        MyYogiyoTableView.dataSource = self
        // 테이블 뷰 경계션 없애기
        MyYogiyoTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        // 로그인 전 테이블 뷰 셀
        MyYogiyoTableView.register(UINib(nibName: "beforeLoginTVCell", bundle: nil),
                                   forCellReuseIdentifier: "beforeLoginTVCell")
        // 로그인 후 테이블 뷰 셀
        MyYogiyoTableView.register(UINib(nibName: "completeLoginTVCell", bundle: nil),
                                   forCellReuseIdentifier: "completeLoginTVCell")
        
        // 쿠폰함 테이블 뷰 셀
        MyYogiyoTableView.register(UINib(nibName: "couponTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "couponTableViewCell")
        
        // 카테고리 테이블 뷰 셀
        MyYogiyoTableView.register(UINib(nibName: "categoryTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "categoryTableViewCell")
        
        
        
        //        self.MyYogiyoTableView.register(NoUserTableViewCell.nib(), forCellReuseIdentifier: NoUserTableViewCell.identifier)
        //        self.MyYogiyoTableView.register(MyYogiyoTableViewCell.nib(), forCellReuseIdentifier: MyYogiyoTableViewCell.identifier)
        //        self.MyYogiyoTableView.register(MyYogiyoLoginTableViewCell.nib(), forCellReuseIdentifier: MyYogiyoLoginTableViewCell.identifier)
        //        self.MyYogiyoTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        //
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
        
        switch indexPath.section {
        case 0:
            // 로그인 성공 시, 호출되는 Cell
            // - true  : 유저의 정보를 보여주는 cell
            // - false : 비회원 상태를 보여주는 cell
            if isLogin == true {
                // 로그인 성공 화면
                let cell = MyYogiyoTableView.dequeueReusableCell(withIdentifier: "completeLoginTVCell",for: indexPath) as! completeLoginTVCell
                
                completeLoginVC = CompleteLoginVC(nibName: "CompleteLoginVC",
                                                  bundle: nil)
                
                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(completeLoginVC!.view)
                
                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(completeLoginVC!)
                
                // autolayout
                completeLoginVC!.view.translatesAutoresizingMaskIntoConstraints = false
                completeLoginVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                completeLoginVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                completeLoginVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                completeLoginVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                
                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                completeLoginVC!.didMove(toParent: self)
                
                return cell
                
            }else {
                // 로그인 전 화면
                let cell = MyYogiyoTableView.dequeueReusableCell(withIdentifier: "beforeLoginTVCell",for: indexPath) as! beforeLoginTVCell
                
                beforeLoginVC = BeforeLoginConVC(nibName: "BeforeLoginConVC",
                                                 bundle: nil)
                
                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(beforeLoginVC!.view)
                
                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(beforeLoginVC!)
                
                // autolayout
                beforeLoginVC!.view.translatesAutoresizingMaskIntoConstraints = false
                beforeLoginVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                beforeLoginVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                beforeLoginVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                beforeLoginVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                
                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                beforeLoginVC!.didMove(toParent: self)
                
                return cell
            }
            
        case 1:
            
            // 쿠폰함
            let cell = MyYogiyoTableView.dequeueReusableCell(withIdentifier: "couponTableViewCell",for: indexPath) as! couponTableViewCell
            
            couponVC = CouponConVC(nibName: "CouponConVC",
                                   bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(couponVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(couponVC!)
            
            // autolayout
            couponVC!.view.translatesAutoresizingMaskIntoConstraints = false
            couponVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            couponVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            couponVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            couponVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            couponVC!.didMove(toParent: self)
            
            return cell
            
            
        case 2:
            
            // 카테고리
            let cell = MyYogiyoTableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell",for: indexPath) as! categoryTableViewCell
            
            categoryVC = CategotyViewController(nibName: "CategotyViewController",
                                                bundle: nil)
            
            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(categoryVC!.view)
            
            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(categoryVC!)
            
            // autolayout
            categoryVC!.view.translatesAutoresizingMaskIntoConstraints = false
            categoryVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            categoryVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            categoryVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            categoryVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
            
            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            categoryVC!.didMove(toParent: self)
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 140
        }else if(indexPath.section == 1){
            return 90
        }else if(indexPath.section == 2){
            return 50
        }else{
            return 0
        }
    }
    
    
}

//MARK: - API
extension MyYogiyoViewController {
    
    func didSuccessLoginAPI() {
        
        self.isLogin = true
        
    }
}
