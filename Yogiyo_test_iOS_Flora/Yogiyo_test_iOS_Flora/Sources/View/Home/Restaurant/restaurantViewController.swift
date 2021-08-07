//
//  restaurantViewController.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/07.
//

import UIKit

class restaurantViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var navigationBarUIView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var headerViewImage: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var RestaurantTableView: UITableView!
    var lastContentOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarUIView.isHidden = true

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if ((navigationBarUIView == nil)) {
//            self.navigationBarUIView.isHidden = true
//            return
//        }
        
        if (self.lastContentOffset <= 0 || self.lastContentOffset > scrollView.contentOffset.y) {
            self.navigationBarUIView.isHidden = true
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            self.navigationBarUIView.isHidden = false
        }
        self.lastContentOffset = scrollView.contentOffset.y
    }

}

