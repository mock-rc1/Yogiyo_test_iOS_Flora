//
//  PayVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/10.
//

import UIKit

class PayVC: UIViewController {

    @IBOutlet weak var sin: UIView!
    @IBOutlet weak var phone: UIView!
    @IBOutlet weak var smile: UIView!
    @IBOutlet weak var payco: UIView!
    @IBOutlet weak var toss: UIView!
    @IBOutlet weak var chai: UIView!
    @IBOutlet weak var naver: UIView!
    @IBOutlet weak var kakao: UIView!
    @IBOutlet weak var cardview: UIView!
    @IBOutlet weak var carcar: UIButton!
    @IBOutlet weak var money: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        cardview.layer.borderWidth = 0.5
        cardview.layer.borderColor = UIColor.systemGray.cgColor
        cardview.layer.cornerRadius = 5
        
        sin.layer.borderWidth = 0.5
        sin.layer.borderColor = UIColor.systemGray.cgColor
        phone.layer.borderWidth = 0.5
        phone.layer.borderColor = UIColor.systemGray.cgColor
        smile.layer.borderWidth = 0.5
        smile.layer.borderColor = UIColor.systemGray.cgColor
        payco.layer.borderWidth = 0.5
        payco.layer.borderColor = UIColor.systemGray.cgColor
        toss.layer.borderWidth = 0.5
        toss.layer.borderColor = UIColor.systemGray.cgColor
        chai.layer.borderWidth = 0.5
        chai.layer.borderColor = UIColor.systemGray.cgColor
        naver.layer.borderWidth = 0.5
        naver.layer.borderColor = UIColor.systemGray.cgColor
        kakao.layer.borderWidth = 0.5
        kakao.layer.borderColor = UIColor.systemGray.cgColor
        
        carcar.layer.borderWidth = 0.5
        carcar.layer.borderColor = UIColor.systemGray.cgColor
        money.layer.borderWidth = 0.5
        money.layer.borderColor = UIColor.systemGray.cgColor
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
