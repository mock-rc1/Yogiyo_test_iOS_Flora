//
//  CouponConVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/03.
//

import UIKit

class CouponConVC: UIViewController {
    
    // 쿠폰함 스택뷰 맞추기

    @IBOutlet weak var couponUIView: UIView!
    @IBOutlet weak var pointUIView: UIView!
    @IBOutlet weak var giftUIView: UIView!
    @IBOutlet weak var reviewUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        couponUIView.layer.addBorder([.right], color: .systemGray5, width: 0.5)
        pointUIView.layer.addBorder([.right], color:.systemGray5, width: 0.5)
        giftUIView.layer.addBorder([.right], color:.systemGray5, width: 0.5)
    }


}
