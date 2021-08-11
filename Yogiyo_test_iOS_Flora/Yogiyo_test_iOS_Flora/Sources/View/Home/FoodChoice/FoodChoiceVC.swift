//
//  FoodChoiceVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class FoodChoiceVC: UIViewController {
    
    @IBOutlet weak var navigationBarUIView: UIView!
    @IBOutlet weak var sharedBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodChoiceTableView: UITableView!
    
    @IBOutlet weak var addOrderBtnView: UIView!
    @IBOutlet weak var orderBtn: UIView!
    
    let headerView = UIView()
    var select = [1,2,3]
    var add = [1,2,3,4]
    var sections = ["헤더뷰","가격","선택","추가","수량","총주문금액"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()
        //navigationBarUIView.isHidden = true
        //nameLabel.isHidden = true
        
        foodChoiceTableView.delegate = self
        foodChoiceTableView.dataSource = self
        setStyle()
        
        self.foodChoiceTableView.register(HeaderTVCell.nib(), forCellReuseIdentifier: HeaderTVCell.identifier)
        self.foodChoiceTableView.register(PriceTVCell.nib(), forCellReuseIdentifier: PriceTVCell.identifier)
        self.foodChoiceTableView.register(SelectTVCell.nib(), forCellReuseIdentifier: SelectTVCell.identifier)
        self.foodChoiceTableView.register(AddTVCell.nib(), forCellReuseIdentifier: AddTVCell.identifier)
        self.foodChoiceTableView.register(quantityTVCell.nib(), forCellReuseIdentifier: quantityTVCell.identifier)
        self.foodChoiceTableView.register(TotalAmountTVCell.nib(), forCellReuseIdentifier: TotalAmountTVCell.identifier)
        
        // 테이블뷰 그룹으로 했을 때 섹션푸터때문에 붕 뜨는 현상 없애줌
        foodChoiceTableView.sectionFooterHeight = .leastNonzeroMagnitude
        foodChoiceTableView.separatorColor = UIColor.clear
        
    }
    
    // MARK: UIView tap gesture
       func tapGesture() {
           let tapGesture = UITapGestureRecognizer(target: self, action:#selector(self.screenDidTap(_:)))
           self.orderBtn.addGestureRecognizer(tapGesture)
       }
       @objc private func screenDidTap(_ gesture: UITapGestureRecognizer) {
           guard let dvc = self.storyboard?.instantiateViewController(identifier: "PlaceAnOrderVC")else{return}
           self.present(dvc, animated: true, completion:nil)
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        headerView.layer.addBorder([.top], color: .systemGray4, width: 0.5)
        
    }
    
    func setStyle() {
        // 테이블 뷰 경계션 없애기
        foodChoiceTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension FoodChoiceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else if section == 2 {
            return select.count
        }
        else if section == 3 {
            return add.count
        }
        else if section == 4 {
            return 1
        }
        else if section == 5 {
            return 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTVCell.identifier) as? HeaderTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PriceTVCell.identifier) as? PriceTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectTVCell.identifier) as? SelectTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddTVCell.identifier) as? AddTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: quantityTVCell.identifier) as? quantityTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        else if indexPath.section == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TotalAmountTVCell.identifier) as? TotalAmountTVCell else{
                return UITableViewCell()
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350
        }
        else if indexPath.section == 1 {
            return 50
        }
        else if indexPath.section == 2 {
            return 40
        }
        else if indexPath.section == 3 {
            return 40
        }
        else if indexPath.section == 4 {
            return 50
        }
        else if indexPath.section == 5 {
            return 60
        }
        else {
            return 0
        }
    }
    
    // 섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        }
        if section == 1 {
            return CGFloat.leastNormalMagnitude
        }
        if section == 4 {
            return CGFloat.leastNormalMagnitude
        }
        if section == 5 {
            return CGFloat.leastNormalMagnitude
        }
        else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        

        if section == 2 {
            
            let headerView = UIView()
            headerView.backgroundColor = .white
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.text = "선택"
            titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            titleLabel.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
            
        }
        if section == 3 {
            
            
            headerView.backgroundColor = .white
            
            headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            
            let titleLabel = UILabel()
            titleLabel.textColor = .black
            titleLabel.text = "추가"
            titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            titleLabel.frame = CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
            headerView.addSubview(titleLabel)
            
            return headerView
            
            
        }
       
        return UIView()
    }
    
 
    
    
}
