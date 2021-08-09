//
//  restaurantViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/07.
//

import UIKit

class restaurantViewController: UIViewController, UIScrollViewDelegate {
    
    var sections = ["탭바전까지셀","찜공유컨트롤러","탭바"]

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var navigationBarUIView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var headerViewImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var RestaurantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUIView.isHidden = true
        restaurantLabel.isHidden = true
        
        //self.locationTableView.register(CurrentLocationTVCell.nib(), forCellReuseIdentifier: CurrentLocationTVCell.identifier)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
