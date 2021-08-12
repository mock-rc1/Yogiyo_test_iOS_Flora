//
//  DeliveryVC.swift
//  Yogiyo_test_iOS_Flora
//
//  Created by 김수정 on 2021/08/11.
//

import UIKit

class DeliveryVC: UIViewController {

    @IBOutlet weak var detailOrderBtn: UIButton!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailOrderBtn.layer.borderWidth = 0.5
        detailOrderBtn.layer.borderColor = #colorLiteral(red: 0.9824901223, green: 0.07490251213, blue: 0.3653975725, alpha: 1)
        imageView.layer.cornerRadius = 10
    }


}
