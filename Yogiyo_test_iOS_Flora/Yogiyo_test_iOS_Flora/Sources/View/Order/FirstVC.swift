//
//  FirstVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit
import XLPagerTabStrip

class FirstVC: UIViewController, IndicatorInfoProvider {

    let sections = ["배너","배달완료창"]
    var deliveryDone = [1,2,3]
    // 배달완료
    var deliveryVC : DeliveryVC?
    
    @IBOutlet weak var packTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setStyle()
        setCellRegister()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "배달/포장주문")
    }
    
    // MARK: - Fuction
    // tableview delegate & datasource
    func setDelegate() {
        packTableView.delegate = self
        packTableView.dataSource = self
    }
    
    // setStyle
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        packTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    // setCellRegister
    func setCellRegister() {
        // cell
        self.packTableView.register(PackTVCell.nib(), forCellReuseIdentifier: PackTVCell.identifier)
       
        // controller cell
        self.packTableView.register(UINib(nibName: "DeliveryTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "DeliveryTableViewCell")
    }

}

// MARK: - Extension
extension FirstVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return deliveryDone.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PackTVCell.identifier) as? PackTVCell else{
                return UITableViewCell()
            }
            
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = packTableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell",for: indexPath) as! DeliveryTableViewCell

            deliveryVC = DeliveryVC(nibName: "DeliveryVC",
                                              bundle: nil)

            // 셀에 컨트롤러의 View를 추가
            cell.addSubview(deliveryVC!.view)

            // 하위 컨트롤러를 상위 컨트롤러에 추가
            self.addChild(deliveryVC!)

            // autolayout
            deliveryVC!.view.translatesAutoresizingMaskIntoConstraints = false
            deliveryVC!.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
            deliveryVC!.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
            deliveryVC!.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true
            deliveryVC!.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true

            // 하위 컨트롤러가 컨트롤러 권한을 상위컨트롤러로 위임
            deliveryVC!.didMove(toParent: self)

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
            return 100
        }
        else if indexPath.section == 1 {
            return 190
        }
        else {
            return 0
        }
    }
}
