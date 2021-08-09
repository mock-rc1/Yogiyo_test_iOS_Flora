//
//  FoodChoiceVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/09.
//

import UIKit

class FoodChoiceVC: UIViewController {

    @IBOutlet weak var sharedBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodChoiceTableView: UITableView!
    
    var sections = ["헤더뷰","가격","선택","추가","수량","총주문금액"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
