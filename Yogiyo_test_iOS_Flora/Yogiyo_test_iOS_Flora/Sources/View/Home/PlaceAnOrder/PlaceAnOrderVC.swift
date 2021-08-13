//
//  PlaceAnOrderVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class PlaceAnOrderVC: UIViewController {

    @IBOutlet weak var OrderTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    var sections = ["주문자정보","결제수단","쿠폰함","배달주문내역","결제버튼"]
    let dogBreed = ["단무지/치킨무/반찬류 안주셔도 돼요.", "벨은 누르지 말아주세요", "도착 후 전화주시면 직접 받으러 갈게요", "그냥 문 앞에 놓아주시면 돼요"]
   
    var orderInfo : OrderInfoVC?
    var pay : PayVC?
    var selectCoupon : SelectCouponVC?
    var btn : BtnVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setStyle()
        setCellRegister()
        // 바탕 누르면 키보드 없어지기
        dismissKeyboardWhenTappedAround()
        
    }
    
    // MARK: - Fuction
    // tableview delegate & datasource
    func setDelegate() {
        OrderTableView.delegate = self
        OrderTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        OrderTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // setCellRegister
    func setCellRegister() {
        // cell
        self.OrderTableView.register(OrderHistoryTVCell.nib(), forCellReuseIdentifier: OrderHistoryTVCell.identifier)
        
        // controller cell
        self.OrderTableView.register(UINib(nibName: "OrderInfoTVCell", bundle: nil),
                                   forCellReuseIdentifier: "OrderInfoTVCell")
        self.OrderTableView.register(UINib(nibName: "PayTVCell", bundle: nil),
                                   forCellReuseIdentifier: "PayTVCell")
        self.OrderTableView.register(UINib(nibName: "SelectCouponTVCell", bundle: nil),
                                   forCellReuseIdentifier: "SelectCouponTVCell")
        self.OrderTableView.register(UINib(nibName: "BtnTVCell", bundle: nil),
                                   forCellReuseIdentifier: "BtnTVCell")
    }
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PlaceAnOrderVC: UITableViewDelegate, UITableViewDataSource {
        
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
                
                let cell = OrderTableView.dequeueReusableCell(withIdentifier: "OrderInfoTVCell",for: indexPath) as! OrderInfoTVCell
                
                orderInfo = OrderInfoVC(nibName: "OrderInfoVC",
                                                  bundle: nil)
                
                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(orderInfo!.view)
                
                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(orderInfo!)
                
                // autolayout
                orderInfo!.view.translatesAutoresizingMaskIntoConstraints = false
                orderInfo!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                orderInfo!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                orderInfo!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                orderInfo!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true
                
                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                orderInfo!.didMove(toParent: self)
                
                orderInfo?.firstLabel.text = "서울특별시 마포구 동교동 홍대입구역"
                orderInfo?.secondLabel.text = "[도로명] 양화로 188 홍대입구역"
                
                return cell
            }
            else if indexPath.section == 1 {
                
                let cell = OrderTableView.dequeueReusableCell(withIdentifier: "PayTVCell",for: indexPath) as! PayTVCell

                pay = PayVC(nibName: "PayVC",
                                                  bundle: nil)

                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(pay!.view)

                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(pay!)

                // autolayout
                pay!.view.translatesAutoresizingMaskIntoConstraints = false
                pay!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                pay!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                pay!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                pay!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true

                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                pay!.didMove(toParent: self)

                return cell
            }
            else if indexPath.section == 2 {
                
                let cell = OrderTableView.dequeueReusableCell(withIdentifier: "SelectCouponTVCell",for: indexPath) as! SelectCouponTVCell

                selectCoupon = SelectCouponVC(nibName: "SelectCouponVC",
                                                  bundle: nil)

                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(selectCoupon!.view)

                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(selectCoupon!)

                // autolayout
                selectCoupon!.view.translatesAutoresizingMaskIntoConstraints = false
                selectCoupon!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                selectCoupon!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                selectCoupon!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                selectCoupon!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true

                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                selectCoupon!.didMove(toParent: self)

                return cell
            }
            
            if indexPath.section == 3 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderHistoryTVCell.identifier) as? OrderHistoryTVCell else{
                    return UITableViewCell()
                }
                cell.cost.text = "8,000원"
                return cell
            }
            
            if indexPath.section == 4 {
                let cell = OrderTableView.dequeueReusableCell(withIdentifier: "BtnTVCell",for: indexPath) as! BtnTVCell

                btn = BtnVC(nibName: "BtnVC",
                                                  bundle: nil)

                // 셀에 컨트롤러의 View를 추가
                cell.addSubview(btn!.view)

                // 하위 컨트롤러를 상위 컨트롤러에 추가
                self.addChild(btn!)

                // autolayout
                btn!.view.translatesAutoresizingMaskIntoConstraints = false
                btn!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
                btn!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
                btn!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
                btn!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true

                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
                btn!.didMove(toParent: self)
                
               
                
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
                return 490
            }
            else if indexPath.section == 1 {
                return 840
            }
            else if indexPath.section == 2 {
                return 320
            }
            else if indexPath.section == 3 {
                return 300
            }
            else if indexPath.section == 4 {
                return 70
            }
            else {
                return 0
            }
        }
        
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            if section == 0 {
//                return 0
//            }
//            if section == 1 {
//                return 0
//            }
//            if section == 2 {
//                return 0
//            }
//            if section == 3 {
//                return 0
//            }
//            if section == 4 {
//                return 0
//            }
//            if section == 5 {
//                return 0
//            }
//            if section == 6 {
//                return 50
//            }
//            else {
//                return 50
//            }
//        }
//
//        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            if section == 0 {
//                return UIView(frame: .null)
//            }
//            if section == 1 {
//              return UIView(frame: .null)
//            }
//            if section == 2 {
//              return UIView(frame: .null)
//            }
//            if section == 3 {
//              return UIView(frame: .null)
//            }
//            if section == 4 {
//              return UIView(frame: .null)
//            }
//            if section == 5 {
//              return UIView(frame: .null)
//            }
//            if section == 6 {
//              let headerView = UIView()
//              headerView.backgroundColor = .white
//              headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
//
//              let titleLabel = UILabel()
//              titleLabel.textColor = .black
//              titleLabel.text = "오늘은 요기서 먹어요"
//              titleLabel.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
//              headerView.addSubview(titleLabel)
//
//              return headerView
//            }
//            else {
//                homeHashTagVC = HomeHashTagVC(nibName: "HomeHashTagVC", bundle: nil)
//
//              let headerView = UIView()
//              headerView.backgroundColor = .red
//              headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
//
//                headerView.addSubview(homeHashTagVC!.view)
//
//                self.addChild(homeHashTagVC!)
//
//                // autolayout
//                homeHashTagVC!.view.translatesAutoresizingMaskIntoConstraints = false
//
//                homeHashTagVC!.view.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
//                homeHashTagVC!.view.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
//                homeHashTagVC!.view.leftAnchor.constraint(equalTo: headerView.leftAnchor).isActive = true
//                homeHashTagVC!.view.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
//
//                // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
//                homeHashTagVC!.didMove(toParent: self)
//
//
//              return headerView
//            }
//        }
        
  
    
}




