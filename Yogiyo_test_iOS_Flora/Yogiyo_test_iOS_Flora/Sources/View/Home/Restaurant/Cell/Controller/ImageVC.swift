//
//  ImageVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var sharedBtnView: UIView!
    @IBOutlet weak var jjimBtnVIew: UIView!
    @IBOutlet weak var deliveryTipLabel: UILabel!
    @IBOutlet weak var minOrderLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var starScoreLabel: UILabel!
    @IBOutlet weak var storeAddressLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jjimBtnVIew.layer.borderWidth = 0.5
        jjimBtnVIew.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        sharedBtnView.layer.borderWidth = 0.5
        sharedBtnView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        moreBtn.layer.borderWidth = 0.5
        moreBtn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        callBtn.layer.borderWidth = 0.5
        callBtn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
      
    }



}
